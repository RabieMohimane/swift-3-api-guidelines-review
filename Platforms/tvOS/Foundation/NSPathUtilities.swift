
extension NSString {
  class func pathWith(components components: [String]) -> String
  var pathComponents: [String] { get }
  var isAbsolutePath: Bool { get }
  var lastPathComponent: String { get }
  var deletingLastPathComponent: String { get }
  func appendingPathComponent(str: String) -> String
  var pathExtension: String { get }
  var deletingPathExtension: String { get }
  func appendingPathExtension(str: String) -> String?
  var abbreviatingWithTildeInPath: String { get }
  var expandingTildeInPath: String { get }
  var standardizingPath: String { get }
  var resolvingSymlinksInPath: String { get }
  func stringsByAppendingPaths(paths: [String]) -> [String]
  func completePathInto(outputName: AutoreleasingUnsafeMutablePointer<NSString?>, caseSensitive flag: Bool, matchesInto outputArray: AutoreleasingUnsafeMutablePointer<NSArray?>, filterTypes: [String]?) -> Int
  var fileSystemRepresentation: UnsafePointer<Int8> { get }
  func getFileSystemRepresentation(cname: UnsafeMutablePointer<Int8>, maxLength max: Int) -> Bool
}
extension NSArray {
  func pathsMatching(extensions filterTypes: [String]) -> [String]
}
func userName() -> String
func fullUserName() -> String
func homeDirectory() -> String
func homeDirectoryForUser(userName: String?) -> String?
func temporaryDirectory() -> String
func openStepRootDirectory() -> String
enum SearchPathDirectory : UInt {
  init?(rawValue: UInt)
  var rawValue: UInt { get }
  case applicationDirectory
  case demoApplicationDirectory
  case developerApplicationDirectory
  case adminApplicationDirectory
  case libraryDirectory
  case developerDirectory
  case userDirectory
  case documentationDirectory
  case documentDirectory
  case coreServiceDirectory
  @available(tvOS 4.0, *)
  case autosavedInformationDirectory
  case desktopDirectory
  case cachesDirectory
  case applicationSupportDirectory
  @available(tvOS 2.0, *)
  case downloadsDirectory
  @available(tvOS 4.0, *)
  case inputMethodsDirectory
  @available(tvOS 4.0, *)
  case moviesDirectory
  @available(tvOS 4.0, *)
  case musicDirectory
  @available(tvOS 4.0, *)
  case picturesDirectory
  @available(tvOS 4.0, *)
  case printerDescriptionDirectory
  @available(tvOS 4.0, *)
  case sharedPublicDirectory
  @available(tvOS 4.0, *)
  case preferencePanesDirectory
  @available(tvOS 4.0, *)
  case itemReplacementDirectory
  case allApplicationsDirectory
  case allLibrariesDirectory
}
struct SearchPathDomainMask : OptionSetType {
  init(rawValue: UInt)
  let rawValue: UInt
  static var userDomainMask: SearchPathDomainMask { get }
  static var localDomainMask: SearchPathDomainMask { get }
  static var networkDomainMask: SearchPathDomainMask { get }
  static var systemDomainMask: SearchPathDomainMask { get }
  static var allDomainsMask: SearchPathDomainMask { get }
}
func searchPathForDirectoriesInDomains(directory: SearchPathDirectory, _ domainMask: SearchPathDomainMask, _ expandTilde: Bool) -> [String]