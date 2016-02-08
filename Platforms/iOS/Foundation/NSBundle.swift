
class Bundle : Object {
  class func main() -> Bundle
  init?(path: String)
  @available(iOS 4.0, *)
  convenience init?(url: URL)
  /*not inherited*/ init(forClass aClass: AnyClass)
  /*not inherited*/ init?(identifier: String)
  class func allBundles() -> [Bundle]
  class func allFrameworks() -> [Bundle]
  func load() -> Bool
  var isLoaded: Bool { get }
  func unload() -> Bool
  @available(iOS 2.0, *)
  func preflight() throws
  @available(iOS 2.0, *)
  func loadAndReturnError() throws
  @available(iOS 4.0, *)
  @NSCopying var bundleURL: URL { get }
  @available(iOS 4.0, *)
  @NSCopying var resourceURL: URL? { get }
  @available(iOS 4.0, *)
  @NSCopying var executableURL: URL? { get }
  @available(iOS 4.0, *)
  func urlFor(auxiliaryExecutable executableName: String) -> URL?
  @available(iOS 4.0, *)
  @NSCopying var privateFrameworksURL: URL? { get }
  @available(iOS 4.0, *)
  @NSCopying var sharedFrameworksURL: URL? { get }
  @available(iOS 4.0, *)
  @NSCopying var sharedSupportURL: URL? { get }
  @available(iOS 4.0, *)
  @NSCopying var builtInPlugInsURL: URL? { get }
  @available(iOS 7.0, *)
  @NSCopying var appStoreReceiptURL: URL? { get }
  var bundlePath: String { get }
  var resourcePath: String? { get }
  var executablePath: String? { get }
  func pathFor(auxiliaryExecutable executableName: String) -> String?
  var privateFrameworksPath: String? { get }
  var sharedFrameworksPath: String? { get }
  var sharedSupportPath: String? { get }
  var builtInPlugInsPath: String? { get }
  @available(iOS 4.0, *)
  class func urlFor(resource name: String?, withExtension ext: String?, subdirectory subpath: String?, inBundleWith bundleURL: URL) -> URL?
  @available(iOS 4.0, *)
  class func urlsForResourcesWith(extension ext: String?, subdirectory subpath: String?, inBundleWith bundleURL: URL) -> [URL]?
  @available(iOS 4.0, *)
  func urlFor(resource name: String?, withExtension ext: String?) -> URL?
  @available(iOS 4.0, *)
  func urlFor(resource name: String?, withExtension ext: String?, subdirectory subpath: String?) -> URL?
  @available(iOS 4.0, *)
  func urlFor(resource name: String?, withExtension ext: String?, subdirectory subpath: String?, localization localizationName: String?) -> URL?
  @available(iOS 4.0, *)
  func urlsForResourcesWith(extension ext: String?, subdirectory subpath: String?) -> [URL]?
  @available(iOS 4.0, *)
  func urlsForResourcesWith(extension ext: String?, subdirectory subpath: String?, localization localizationName: String?) -> [URL]?
  class func pathFor(resource name: String?, ofType ext: String?, inDirectory bundlePath: String) -> String?
  class func pathsForResourcesOf(type ext: String?, inDirectory bundlePath: String) -> [String]
  func pathFor(resource name: String?, ofType ext: String?) -> String?
  func pathFor(resource name: String?, ofType ext: String?, inDirectory subpath: String?) -> String?
  func pathFor(resource name: String?, ofType ext: String?, inDirectory subpath: String?, forLocalization localizationName: String?) -> String?
  func pathsForResourcesOf(type ext: String?, inDirectory subpath: String?) -> [String]
  func pathsForResourcesOf(type ext: String?, inDirectory subpath: String?, forLocalization localizationName: String?) -> [String]
  func localizedStringFor(key key: String, value: String?, table tableName: String?) -> String
  var bundleIdentifier: String? { get }
  var infoDictionary: [String : AnyObject]? { get }
  var localizedInfoDictionary: [String : AnyObject]? { get }
  func objectFor(infoDictionaryKey key: String) -> AnyObject?
  func classNamed(className: String) -> AnyClass?
  var principalClass: AnyClass? { get }
  var preferredLocalizations: [String] { get }
  var localizations: [String] { get }
  var developmentLocalization: String? { get }
  class func preferredLocalizationsFrom(localizationsArray: [String]) -> [String]
  class func preferredLocalizationsFrom(localizationsArray: [String], forPreferences preferencesArray: [String]?) -> [String]
  @available(iOS 2.0, *)
  var executableArchitectures: [Number]? { get }
  convenience init()
}
var bundleExecutableArchitectureI386: Int { get }
var bundleExecutableArchitecturePPC: Int { get }
var bundleExecutableArchitectureX86_64: Int { get }
var bundleExecutableArchitecturePPC64: Int { get }
extension NSString {
  @available(iOS 9.0, *)
  func variantFittingPresentationWidth(width: Int) -> String
}
let bundleDidLoadNotification: String
let loadedClasses: String
@available(iOS 9.0, *)
class BundleResourceRequest : Object, ProgressReporting {
  convenience init(tags: Set<String>)
  init(tags: Set<String>, bundle: Bundle)
  var loadingPriority: Double
  var tags: Set<String> { get }
  var bundle: Bundle { get }
  func beginAccessingResources(completionHandler completionHandler: (Error?) -> Void)
  func conditionallyBeginAccessingResourcesWith(completionHandler completionHandler: (Bool) -> Void)
  func endAccessingResources()
  var progress: Progress { get }
}
extension Bundle {
  @available(iOS 9.0, *)
  func setPreservationPriority(priority: Double, forTags tags: Set<String>)
  @available(iOS 9.0, *)
  func preservationPriorityFor(tag tag: String) -> Double
}
@available(iOS 9.0, *)
let bundleResourceRequestLowDiskSpaceNotification: String
@available(iOS 9.0, *)
let bundleResourceRequestLoadingPriorityUrgent: Double