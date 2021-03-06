
@available(iOS 9.0, *)
let HKDevicePropertyKeyName: String
@available(iOS 9.0, *)
let HKDevicePropertyKeyManufacturer: String
@available(iOS 9.0, *)
let HKDevicePropertyKeyModel: String
@available(iOS 9.0, *)
let HKDevicePropertyKeyHardwareVersion: String
@available(iOS 9.0, *)
let HKDevicePropertyKeyFirmwareVersion: String
@available(iOS 9.0, *)
let HKDevicePropertyKeySoftwareVersion: String
@available(iOS 9.0, *)
let HKDevicePropertyKeyLocalIdentifier: String
@available(iOS 9.0, *)
let HKDevicePropertyKeyUDIDeviceIdentifier: String
@available(iOS 9.0, *)
class HKDevice : NSObject, NSSecureCoding, NSCopying {
  var name: String { get }
  var manufacturer: String? { get }
  var model: String? { get }
  var hardwareVersion: String? { get }
  var firmwareVersion: String? { get }
  var softwareVersion: String? { get }
  var localIdentifier: String? { get }
  var udiDeviceIdentifier: String? { get }
  init(name name: String?, manufacturer manufacturer: String?, model model: String?, hardwareVersion hardwareVersion: String?, firmwareVersion firmwareVersion: String?, softwareVersion softwareVersion: String?, localIdentifier localIdentifier: String?, udiDeviceIdentifier UDIDeviceIdentifier: String?)
  class func local() -> HKDevice
  @available(iOS 9.0, *)
  class func supportsSecureCoding() -> Bool
  @available(iOS 9.0, *)
  func encode(with aCoder: NSCoder)
  init?(coder aDecoder: NSCoder)
  @available(iOS 9.0, *)
  func copy(with zone: NSZone = nil) -> AnyObject
}
