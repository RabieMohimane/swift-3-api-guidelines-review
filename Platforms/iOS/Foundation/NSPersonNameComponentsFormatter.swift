
@available(iOS 9.0, *)
enum PersonNameComponentsFormatterStyle : Int {
  init?(rawValue: Int)
  var rawValue: Int { get }
  case `default`
  case short
  case medium
  case long
  case abbreviated
}
@available(iOS 9.0, *)
struct PersonNameComponentsFormatterOptions : OptionSetType {
  init(rawValue: UInt)
  let rawValue: UInt
  static var phonetic: PersonNameComponentsFormatterOptions { get }
}
@available(iOS 9.0, *)
class PersonNameComponentsFormatter : Formatter {
  var style: PersonNameComponentsFormatterStyle
  var isPhonetic: Bool
  class func localizedStringFrom(components: PersonNameComponents, style nameFormatStyle: PersonNameComponentsFormatterStyle, options nameOptions: PersonNameComponentsFormatterOptions = []) -> String
  func stringFrom(components: PersonNameComponents) -> String
  func annotatedStringFrom(components: PersonNameComponents) -> AttributedString
  func getObjectValue(obj: AutoreleasingUnsafeMutablePointer<AnyObject?>, forString string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool
  init()
  init?(coder aDecoder: Coder)
}
@available(iOS 9.0, *)
let personNameComponentKey: String
@available(iOS 9.0, *)
let personNameComponentGivenName: String
@available(iOS 9.0, *)
let personNameComponentFamilyName: String
@available(iOS 9.0, *)
let personNameComponentMiddleName: String
@available(iOS 9.0, *)
let personNameComponentPrefix: String
@available(iOS 9.0, *)
let personNameComponentSuffix: String
@available(iOS 9.0, *)
let personNameComponentNickname: String
@available(iOS 9.0, *)
let personNameComponentDelimiter: String