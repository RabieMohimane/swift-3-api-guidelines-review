
@available(tvOS 8.0, *)
class CKFetchRecordZonesOperation : CKDatabaseOperation {
  class func fetchAll() -> Self
  convenience init(recordZoneIDs zoneIDs: [CKRecordZoneID])
  var recordZoneIDs: [CKRecordZoneID]?
  var fetchRecordZonesCompletionBlock: (([CKRecordZoneID : CKRecordZone]?, NSError?) -> Void)?
}
