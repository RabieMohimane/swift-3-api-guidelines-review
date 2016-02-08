
@available(OSX 10.10, *)
let AVAudioUnitTypeOutput: String
@available(OSX 10.10, *)
let AVAudioUnitTypeMusicDevice: String
@available(OSX 10.10, *)
let AVAudioUnitTypeMusicEffect: String
@available(OSX 10.10, *)
let AVAudioUnitTypeFormatConverter: String
@available(OSX 10.10, *)
let AVAudioUnitTypeEffect: String
@available(OSX 10.10, *)
let AVAudioUnitTypeMixer: String
@available(OSX 10.10, *)
let AVAudioUnitTypePanner: String
@available(OSX 10.10, *)
let AVAudioUnitTypeGenerator: String
@available(OSX 10.10, *)
let AVAudioUnitTypeOfflineEffect: String
@available(OSX 10.10, *)
let AVAudioUnitTypeMIDIProcessor: String
@available(OSX 10.10, *)
let AVAudioUnitManufacturerNameApple: String
@available(OSX 10.10, *)
class AVAudioUnitComponent : Object {
  var name: String { get }
  var typeName: String { get }
  var localizedTypeName: String { get }
  var manufacturerName: String { get }
  var version: Int { get }
  var versionString: String { get }
  @available(OSX, introduced=10.10, deprecated=10.11)
  var componentURL: URL? { get }
  @available(OSX 10.10, *)
  var availableArchitectures: [Number] { get }
  var isSandboxSafe: Bool { get }
  var hasMIDIInput: Bool { get }
  var hasMIDIOutput: Bool { get }
  var audioComponent: AudioComponent { get }
  @available(OSX 10.10, *)
  var userTagNames: [String]
  var allTagNames: [String] { get }
  var audioComponentDescription: AudioComponentDescription { get }
  @available(OSX 10.10, *)
  var iconURL: URL? { get }
  @available(OSX 10.11, *)
  var icon: NSImage? { get }
  @available(OSX 10.10, *)
  var passesAUVal: Bool { get }
  @available(OSX 10.10, *)
  var hasCustomView: Bool { get }
  @available(OSX 10.10, *)
  var configurationDictionary: [String : AnyObject] { get }
  @available(OSX 10.10, *)
  func supportsNumberInputChannels(numInputChannels: Int, outputChannels numOutputChannels: Int) -> Bool
  init()
}
@available(OSX 10.10, *)
let AVAudioUnitComponentTagsDidChangeNotification: String
@available(OSX 10.10, *)
class AVAudioUnitComponentManager : Object {
  var tagNames: [String] { get }
  var standardLocalizedTagNames: [String] { get }
  class func shared() -> Self
  func componentsMatching(predicate: Predicate) -> [AVAudioUnitComponent]
  func componentsPassingTest(testHandler: (AVAudioUnitComponent, UnsafeMutablePointer<ObjCBool>) -> Bool) -> [AVAudioUnitComponent]
  func componentsMatching(desc: AudioComponentDescription) -> [AVAudioUnitComponent]
  init()
}