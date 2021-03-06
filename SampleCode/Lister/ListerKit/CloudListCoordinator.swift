/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The `CloudListCoordinator` class handles querying for and interacting with lists stored as files in iCloud Drive.
*/

import Foundation

/**
    An object that conforms to the `CloudListCoordinator` protocol and is responsible for implementing
    entry points in order to communicate with an `ListCoordinatorDelegate`. In the case of Lister,
    this is the `ListsController` instance. The main responsibility of a `CloudListCoordinator` is
    to track different `NSURL` instances that are important. The iCloud coordinator is responsible for
    making sure that the `ListsController` knows about the current set of iCloud documents that are
    available.

    There are also other responsibilities that an `CloudListCoordinator` must have that are specific
    to the underlying storage mechanism of the coordinator. A `CloudListCoordinator` determines whether
    or not a new list can be created with a specific name, it removes URLs tied to a specific list, and
    it is also responsible for listening for updates to any changes that occur at a specific URL
    (e.g. a list document is updated on another device, etc.).

    Instances of `CloudListCoordinator` can search for URLs in an asynchronous way. When a new `NSURL`
    instance is found, removed, or updated, the `ListCoordinator` instance must make its delegate
    aware of the updates. If a failure occured in removing or creating an `NSURL` for a given list,
    it must make its delegate aware by calling one of the appropriate error methods defined in the
    `ListCoordinatorDelegate` protocol.
*/
public class CloudListCoordinator: ListCoordinator {
    // MARK: Properties
    
    public weak var delegate: ListCoordinatorDelegate?
    
    /// Closure executed after the first update provided by the coordinator regarding tracked URLs.
    private var firstQueryUpdateHandler: (Void -> Void)?
    
    /// Initialized asynchronously in init(predicate:).
    private var _documentsDirectory: URL!
    
    public var documentsDirectory: URL {
        var documentsDirectory: URL!
        
        dispatch_sync(documentsDirectoryQueue) {
            documentsDirectory = self._documentsDirectory
        }
        
        return documentsDirectory
    }

    private var metadataQuery: MetadataQuery
    
    /// A private, local queue to `CloudListCoordinator` that is used to ensure serial accesss to `documentsDirectory`.
    private let documentsDirectoryQueue = dispatch_queue_create("com.example.apple-samplecode.lister.cloudlistcoordinator", DISPATCH_QUEUE_CONCURRENT)
    
    // MARK: Initializers
    
    /**
        Initializes an `CloudListCoordinator` based on a path extension used to identify files that can be
        managed by the app. Also provides a block parameter that can be used to provide actions to be executed
        when the coordinator returns its first set of documents. This coordinator monitors the app's iCloud Drive
        container.

        - parameter pathExtension: The extension that should be used to identify documents of interest to this coordinator.
        - parameter firstQueryUpdateHandler: The handler that is executed once the first results are returned.
    */
    public convenience init(pathExtension: String, firstQueryUpdateHandler: (Void -> Void)? = nil) {
        let predicate = Predicate(format: "(%K.pathExtension = %@)", argumentArray: [metadataItemURLKey, pathExtension])
        
        self.init(predicate: predicate, firstQueryUpdateHandler: firstQueryUpdateHandler)
    }
    
    /**
        Initializes an `CloudListCoordinator` based on a single document used to identify a file that should
        be monitored. Also provides a block parameter that can be used to provide actions to be executed when the
        coordinator returns its initial result. This coordinator monitors the app's iCloud Drive container.

        - parameter lastPathComponent: The file name that should be monitored by this coordinator.
        - parameter firstQueryUpdateHandler: The handler that is executed once the first results are returned.
    */
    public convenience init(lastPathComponent: String, firstQueryUpdateHandler: (Void -> Void)? = nil) {
        let predicate = Predicate(format: "(%K.lastPathComponent = %@)", argumentArray: [metadataItemURLKey, lastPathComponent])

        self.init(predicate: predicate, firstQueryUpdateHandler: firstQueryUpdateHandler)
    }
    
    private init(predicate: Predicate, firstQueryUpdateHandler: (Void -> Void)?) {
        self.firstQueryUpdateHandler = firstQueryUpdateHandler
        
        metadataQuery = MetadataQuery()

        // These search scopes search for files in iCloud Drive.
        metadataQuery.searchScopes = [metadataQueryUbiquitousDocumentsScope, metadataQueryAccessibleUbiquitousExternalDocumentsScope]
        
        metadataQuery.predicate = predicate
        
        dispatch_barrier_async(documentsDirectoryQueue) {
            let cloudContainerURL = FileManager.defaultManager().urlForUbiquityContainerIdentifier(nil)

            self._documentsDirectory = cloudContainerURL?.appendingPathComponent("Documents")
        }
        
        // Observe the query.
        let notificationCenter = NotificationCenter.defaultCenter()
        
        notificationCenter.addObserver(self, selector: "metadataQueryDidFinishGathering:", name: metadataQueryDidFinishGatheringNotification, object: metadataQuery)

        notificationCenter.addObserver(self, selector: "metadataQueryDidUpdate:", name: metadataQueryDidUpdateNotification, object: metadataQuery)
    }
    
    // MARK: Lifetime
    
    deinit {
        // Stop observing the query.
        let notificationCenter = NotificationCenter.defaultCenter()
        notificationCenter.removeObserver(self, name: metadataQueryDidFinishGatheringNotification, object: metadataQuery)
        notificationCenter.removeObserver(self, name: metadataQueryDidUpdateNotification, object: metadataQuery)
    }
    
    // MARK: ListCoordinator
    
    public func startQuery() {
        // `NSMetadataQuery` should always be started on the main thread.
        dispatch_async(dispatch_get_main_queue()) {
            self.metadataQuery.start()
            return
        }
    }
    
    public func stopQuery() {
        // `NSMetadataQuery` should always be stopped on the main thread.
        dispatch_async(dispatch_get_main_queue()) {
            self.metadataQuery.stop()
        }
    }
    
    public func createURLForList(list: List, withName name: String) {
        let documentURL = documentURLForName(name)
        
        ListUtilities.createList(list, atURL: documentURL) { error in
            if let realError = error {
                self.delegate?.listCoordinatorDidFailCreatingListAtURL(documentURL, withError: realError)
            }
            else {
                self.delegate?.listCoordinatorDidUpdateContents(insertedURLs: [documentURL], removedURLs: [], updatedURLs: [])
            }
        }
    }

    public func canCreateListWithName(name: String) -> Bool {
        if name.isEmpty {
            return false
        }
        
        let documentURL = documentURLForName(name)
        
        return !FileManager.defaultManager().fileExistsAtPath(documentURL.path!)
    }
    
    public func copyListFromURL(URL: URL, toListWithName name: String) {
        let documentURL = documentURLForName(name)
        
        ListUtilities.copyFromURL(URL, toURL: documentURL)
    }

    public func removeListAtURL(URL: URL) {
        ListUtilities.removeListAtURL(URL) { error in
            if let realError = error {
                self.delegate?.listCoordinatorDidFailRemovingListAtURL(URL, withError: realError)
            }
            else {
                self.delegate?.listCoordinatorDidUpdateContents(insertedURLs: [], removedURLs: [URL], updatedURLs: [])
            }
        }
    }
    
    // MARK: NSMetadataQuery Notifications
    
    @objc private func metadataQueryDidFinishGathering(notifcation: Notification) {
        metadataQuery.disableUpdates()

        let metadataItems = metadataQuery.results as! [MetadataItem]

        let insertedURLs = metadataItems.map { $0.valueForAttribute(metadataItemURLKey) as! URL }

        delegate?.listCoordinatorDidUpdateContents(insertedURLs: insertedURLs, removedURLs: [], updatedURLs: [])
        
        metadataQuery.enableUpdates()
        
        // Execute the `firstQueryUpdateHandler`, it will contain the closure from initialization on first update.
        if let handler = firstQueryUpdateHandler {
            handler()
            // Set `firstQueryUpdateHandler` to an empty closure so that the handler provided is only run on first update.
            firstQueryUpdateHandler = nil
        }
    }

    /**
        Private methods that are used with Objective-C for notifications, target / action, etc. should
        be marked as @objc.
    */
    @objc private func metadataQueryDidUpdate(notification: Notification) {
        metadataQuery.disableUpdates()
        
        let insertedURLs: [URL]
        let removedURLs: [URL]
        let updatedURLs: [URL]
        
        let metadataItemToURLTransform: MetadataItem -> URL = { metadataItem in
            return metadataItem.valueForAttribute(metadataItemURLKey) as! URL
        }

        if let insertedMetadataItems = notification.userInfo?[metadataQueryUpdateAddedItemsKey] as? [MetadataItem] {
            insertedURLs = insertedMetadataItems.map(metadataItemToURLTransform)
        }
        else {
            insertedURLs = []
        }
        
        if let removedMetadataItems = notification.userInfo?[metadataQueryUpdateRemovedItemsKey] as? [MetadataItem] {
            removedURLs = removedMetadataItems.map(metadataItemToURLTransform)
        }
        else {
            removedURLs = []
        }
        
        if let updatedMetadataItems = notification.userInfo?[metadataQueryUpdateChangedItemsKey] as? [MetadataItem] {
            let completelyDownloadedUpdatedMetadataItems = updatedMetadataItems.filter { updatedMetadataItem in
                let downloadStatus = updatedMetadataItem.valueForAttribute(metadataUbiquitousItemDownloadingStatusKey) as! String

                return downloadStatus == metadataUbiquitousItemDownloadingStatusCurrent
            }

            updatedURLs = completelyDownloadedUpdatedMetadataItems.map(metadataItemToURLTransform)
        }
        else {
            updatedURLs = []
        }
        
        delegate?.listCoordinatorDidUpdateContents(insertedURLs: insertedURLs, removedURLs: removedURLs, updatedURLs: updatedURLs)
        
        metadataQuery.enableUpdates()
    }
    
    // MARK: Convenience
    
    private func documentURLForName(name: String) -> URL {
        let documentURLWithoutExtension = documentsDirectory.appendingPathComponent(name)
        
        return documentURLWithoutExtension.appendingPathExtension(AppConfiguration.listerFileExtension)
    }
}
