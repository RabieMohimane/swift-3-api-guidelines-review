
enum CMMotionActivityConfidence : Int {
  init?(rawValue rawValue: Int)
  var rawValue: Int { get }
  case low
  case medium
  case high
}
@available(watchOS 2.0, *)
class CMMotionActivity : CMLogItem {
  var confidence: CMMotionActivityConfidence { get }
  var startDate: NSDate { get }
  var unknown: Bool { get }
  var stationary: Bool { get }
  var walking: Bool { get }
  var running: Bool { get }
  var automotive: Bool { get }
  @available(watchOS 2.0, *)
  var cycling: Bool { get }
}
