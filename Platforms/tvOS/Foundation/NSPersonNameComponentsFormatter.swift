
@available(tvOS 9.0, *)
enum NSPersonNameComponentsFormatterStyle : Int {
  init?(rawValue rawValue: Int)
  var rawValue: Int { get }
  case `default`
  case short
  case medium
  case long
  case abbreviated
}
@available(tvOS 9.0, *)
struct NSPersonNameComponentsFormatterOptions : OptionSetType {
  init(rawValue rawValue: UInt)
  let rawValue: UInt
  static var phonetic: NSPersonNameComponentsFormatterOptions { get }
}
@available(tvOS 9.0, *)
class NSPersonNameComponentsFormatter : NSFormatter {
  var style: NSPersonNameComponentsFormatterStyle
  var isPhonetic: Bool
  class func localizedString(from components: NSPersonNameComponents, style nameFormatStyle: NSPersonNameComponentsFormatterStyle, options nameOptions: NSPersonNameComponentsFormatterOptions = []) -> String
  func string(from components: NSPersonNameComponents) -> String
  func annotatedString(from components: NSPersonNameComponents) -> NSAttributedString
}
@available(tvOS 9.0, *)
let NSPersonNameComponentKey: String
@available(tvOS 9.0, *)
let NSPersonNameComponentGivenName: String
@available(tvOS 9.0, *)
let NSPersonNameComponentFamilyName: String
@available(tvOS 9.0, *)
let NSPersonNameComponentMiddleName: String
@available(tvOS 9.0, *)
let NSPersonNameComponentPrefix: String
@available(tvOS 9.0, *)
let NSPersonNameComponentSuffix: String
@available(tvOS 9.0, *)
let NSPersonNameComponentNickname: String
@available(tvOS 9.0, *)
let NSPersonNameComponentDelimiter: String
