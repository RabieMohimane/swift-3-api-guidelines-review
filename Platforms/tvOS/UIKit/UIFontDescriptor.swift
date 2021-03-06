
@available(tvOS 7.0, *)
struct UIFontDescriptorSymbolicTraits : OptionSetType {
  init(rawValue rawValue: UInt32)
  let rawValue: UInt32
  static var traitItalic: UIFontDescriptorSymbolicTraits { get }
  static var traitBold: UIFontDescriptorSymbolicTraits { get }
  static var traitExpanded: UIFontDescriptorSymbolicTraits { get }
  static var traitCondensed: UIFontDescriptorSymbolicTraits { get }
  static var traitMonoSpace: UIFontDescriptorSymbolicTraits { get }
  static var traitVertical: UIFontDescriptorSymbolicTraits { get }
  static var traitUIOptimized: UIFontDescriptorSymbolicTraits { get }
  static var traitTightLeading: UIFontDescriptorSymbolicTraits { get }
  static var traitLooseLeading: UIFontDescriptorSymbolicTraits { get }
  static var classMask: UIFontDescriptorSymbolicTraits { get }
  static var classUnknown: UIFontDescriptorSymbolicTraits { get }
  static var classOldStyleSerifs: UIFontDescriptorSymbolicTraits { get }
  static var classTransitionalSerifs: UIFontDescriptorSymbolicTraits { get }
  static var classModernSerifs: UIFontDescriptorSymbolicTraits { get }
  static var classClarendonSerifs: UIFontDescriptorSymbolicTraits { get }
  static var classSlabSerifs: UIFontDescriptorSymbolicTraits { get }
  static var classFreeformSerifs: UIFontDescriptorSymbolicTraits { get }
  static var classSansSerif: UIFontDescriptorSymbolicTraits { get }
  static var classOrnamentals: UIFontDescriptorSymbolicTraits { get }
  static var classScripts: UIFontDescriptorSymbolicTraits { get }
  static var classSymbolic: UIFontDescriptorSymbolicTraits { get }
}
typealias UIFontDescriptorClass = Int
@available(tvOS 7.0, *)
class UIFontDescriptor : NSObject, NSCopying, NSSecureCoding {
  init?(coder aDecoder: NSCoder)
  var postscriptName: String { get }
  var pointSize: CGFloat { get }
  var matrix: CGAffineTransform { get }
  var symbolicTraits: UIFontDescriptorSymbolicTraits { get }
  func object(forKey anAttribute: String) -> AnyObject?
  func fontAttributes() -> [String : AnyObject]
  func matchingFontDescriptors(withMandatoryKeys mandatoryKeys: Set<String>?) -> [UIFontDescriptor]
  /*not inherited*/ init(name fontName: String, size size: CGFloat)
  /*not inherited*/ init(name fontName: String, matrix matrix: CGAffineTransform)
  class func preferredFontDescriptor(withTextStyle style: String) -> UIFontDescriptor
  init(fontAttributes attributes: [String : AnyObject] = [:])
  func addingAttributes(_ attributes: [String : AnyObject] = [:]) -> UIFontDescriptor
  func withSymbolicTraits(_ symbolicTraits: UIFontDescriptorSymbolicTraits) -> UIFontDescriptor
  func withSize(_ newPointSize: CGFloat) -> UIFontDescriptor
  func withMatrix(_ matrix: CGAffineTransform) -> UIFontDescriptor
  func withFace(_ newFace: String) -> UIFontDescriptor
  func withFamily(_ newFamily: String) -> UIFontDescriptor
  @available(tvOS 7.0, *)
  func copy(with zone: NSZone = nil) -> AnyObject
  @available(tvOS 7.0, *)
  class func supportsSecureCoding() -> Bool
  @available(tvOS 7.0, *)
  func encode(with aCoder: NSCoder)
}
@available(tvOS 7.0, *)
let UIFontDescriptorFamilyAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorNameAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorFaceAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorSizeAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorVisibleNameAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorMatrixAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorCharacterSetAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorCascadeListAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorTraitsAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorFixedAdvanceAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorFeatureSettingsAttribute: String
@available(tvOS 7.0, *)
let UIFontDescriptorTextStyleAttribute: String
@available(tvOS 7.0, *)
let UIFontSymbolicTrait: String
@available(tvOS 7.0, *)
let UIFontWeightTrait: String
@available(tvOS 7.0, *)
let UIFontWidthTrait: String
@available(tvOS 7.0, *)
let UIFontSlantTrait: String
@available(tvOS 8.2, *)
let UIFontWeightUltraLight: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightThin: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightLight: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightRegular: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightMedium: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightSemibold: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightBold: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightHeavy: CGFloat
@available(tvOS 8.2, *)
let UIFontWeightBlack: CGFloat
@available(tvOS 7.0, *)
let UIFontFeatureTypeIdentifierKey: String
@available(tvOS 7.0, *)
let UIFontFeatureSelectorIdentifierKey: String
@available(tvOS 9.0, *)
let UIFontTextStyleTitle1: String
@available(tvOS 9.0, *)
let UIFontTextStyleTitle2: String
@available(tvOS 9.0, *)
let UIFontTextStyleTitle3: String
@available(tvOS 7.0, *)
let UIFontTextStyleHeadline: String
@available(tvOS 7.0, *)
let UIFontTextStyleSubheadline: String
@available(tvOS 7.0, *)
let UIFontTextStyleBody: String
@available(tvOS 9.0, *)
let UIFontTextStyleCallout: String
@available(tvOS 7.0, *)
let UIFontTextStyleFootnote: String
@available(tvOS 7.0, *)
let UIFontTextStyleCaption1: String
@available(tvOS 7.0, *)
let UIFontTextStyleCaption2: String
