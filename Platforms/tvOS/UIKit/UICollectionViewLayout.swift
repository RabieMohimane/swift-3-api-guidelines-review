
enum UICollectionElementCategory : UInt {
  init?(rawValue rawValue: UInt)
  var rawValue: UInt { get }
  case cell
  case supplementaryView
  case decorationView
}
@available(tvOS 6.0, *)
class UICollectionViewLayoutAttributes : NSObject, NSCopying, UIDynamicItem {
  var frame: CGRect
  var center: CGPoint
  var size: CGSize
  var transform3D: CATransform3D
  @available(tvOS 7.0, *)
  var bounds: CGRect
  @available(tvOS 7.0, *)
  var transform: CGAffineTransform
  var alpha: CGFloat
  var zIndex: Int
  var isHidden: Bool
  var indexPath: NSIndexPath
  var representedElementCategory: UICollectionElementCategory { get }
  var representedElementKind: String? { get }
  convenience init(forCellWith indexPath: NSIndexPath)
  convenience init(forSupplementaryViewOfKind elementKind: String, with indexPath: NSIndexPath)
  convenience init(forDecorationViewOfKind decorationViewKind: String, with indexPath: NSIndexPath)
  @available(tvOS 6.0, *)
  func copy(with zone: NSZone = nil) -> AnyObject
  @available(tvOS 9.0, *)
  var collisionBoundsType: UIDynamicItemCollisionBoundsType { get }
  @available(tvOS 9.0, *)
  var collisionBoundingPath: UIBezierPath { get }
}
enum UICollectionUpdateAction : Int {
  init?(rawValue rawValue: Int)
  var rawValue: Int { get }
  case insert
  case delete
  case reload
  case move
  case none
}
@available(tvOS 6.0, *)
class UICollectionViewUpdateItem : NSObject {
  var indexPathBeforeUpdate: NSIndexPath? { get }
  var indexPathAfterUpdate: NSIndexPath? { get }
  var updateAction: UICollectionUpdateAction { get }
}
@available(tvOS 7.0, *)
class UICollectionViewLayoutInvalidationContext : NSObject {
  var invalidateEverything: Bool { get }
  var invalidateDataSourceCounts: Bool { get }
  @available(tvOS 8.0, *)
  func invalidateItems(at indexPaths: [NSIndexPath])
  @available(tvOS 8.0, *)
  func invalidateSupplementaryElements(ofKind elementKind: String, at indexPaths: [NSIndexPath])
  @available(tvOS 8.0, *)
  func invalidateDecorationElements(ofKind elementKind: String, at indexPaths: [NSIndexPath])
  @available(tvOS 8.0, *)
  var invalidatedItemIndexPaths: [NSIndexPath]? { get }
  @available(tvOS 8.0, *)
  var invalidatedSupplementaryIndexPaths: [String : [NSIndexPath]]? { get }
  @available(tvOS 8.0, *)
  var invalidatedDecorationIndexPaths: [String : [NSIndexPath]]? { get }
  @available(tvOS 8.0, *)
  var contentOffsetAdjustment: CGPoint
  @available(tvOS 8.0, *)
  var contentSizeAdjustment: CGSize
  @available(tvOS 9.0, *)
  var previousIndexPathsForInteractivelyMovingItems: [NSIndexPath]? { get }
  @available(tvOS 9.0, *)
  var targetIndexPathsForInteractivelyMovingItems: [NSIndexPath]? { get }
  @available(tvOS 9.0, *)
  var interactiveMovementTarget: CGPoint { get }
}
@available(tvOS 6.0, *)
class UICollectionViewLayout : NSObject, NSCoding {
  init?(coder aDecoder: NSCoder)
  var collectionView: UICollectionView? { get }
  func invalidateLayout()
  @available(tvOS 7.0, *)
  func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext)
  func register(_ viewClass: AnyClass?, forDecorationViewOfKind elementKind: String)
  func register(_ nib: UINib?, forDecorationViewOfKind elementKind: String)
  @available(tvOS 6.0, *)
  func encode(with aCoder: NSCoder)
}
extension UICollectionViewLayout {
  class func layoutAttributesClass() -> AnyClass
  @available(tvOS 7.0, *)
  class func invalidationContextClass() -> AnyClass
  func prepare()
  func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
  func layoutAttributesForItem(at indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool
  @available(tvOS 7.0, *)
  func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext
  @available(tvOS 8.0, *)
  func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool
  @available(tvOS 8.0, *)
  func invalidationContext(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutInvalidationContext
  func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint
  @available(tvOS 7.0, *)
  func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint
  func collectionViewContentSize() -> CGSize
}
extension UICollectionViewLayout {
  func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem])
  func finalizeCollectionViewUpdates()
  func prepare(forAnimatedBoundsChange oldBounds: CGRect)
  func finalizeAnimatedBoundsChange()
  @available(tvOS 7.0, *)
  func prepareForTransition(to newLayout: UICollectionViewLayout)
  @available(tvOS 7.0, *)
  func prepareForTransition(from oldLayout: UICollectionViewLayout)
  @available(tvOS 7.0, *)
  func finalizeLayoutTransition()
  func initialLayoutAttributesForAppearingItem(at itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func finalLayoutAttributesForDisappearingItem(at itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func initialLayoutAttributesForAppearingSupplementaryElement(ofKind elementKind: String, at elementIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func finalLayoutAttributesForDisappearingSupplementaryElement(ofKind elementKind: String, at elementIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func initialLayoutAttributesForAppearingDecorationElement(ofKind elementKind: String, at decorationIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  func finalLayoutAttributesForDisappearingDecorationElement(ofKind elementKind: String, at decorationIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
  @available(tvOS 7.0, *)
  func indexPathsToDeleteForSupplementaryView(ofKind elementKind: String) -> [NSIndexPath]
  @available(tvOS 7.0, *)
  func indexPathsToDeleteForDecorationView(ofKind elementKind: String) -> [NSIndexPath]
  @available(tvOS 7.0, *)
  func indexPathsToInsertForSupplementaryView(ofKind elementKind: String) -> [NSIndexPath]
  @available(tvOS 7.0, *)
  func indexPathsToInsertForDecorationView(ofKind elementKind: String) -> [NSIndexPath]
}
extension UICollectionViewLayout {
  @available(tvOS 9.0, *)
  func targetIndexPath(forInteractivelyMovingItem previousIndexPath: NSIndexPath, withPosition position: CGPoint) -> NSIndexPath
  @available(tvOS 9.0, *)
  func layoutAttributesForInteractivelyMovingItem(at indexPath: NSIndexPath, withTargetPosition position: CGPoint) -> UICollectionViewLayoutAttributes
  @available(tvOS 9.0, *)
  func invalidationContext(forInteractivelyMovingItems targetIndexPaths: [NSIndexPath], withTargetPosition targetPosition: CGPoint, previousIndexPaths previousIndexPaths: [NSIndexPath], previousPosition previousPosition: CGPoint) -> UICollectionViewLayoutInvalidationContext
  @available(tvOS 9.0, *)
  func invalidationContextForEndingInteractiveMovementOfItems(toFinalIndexPaths indexPaths: [NSIndexPath], previousIndexPaths previousIndexPaths: [NSIndexPath], movementCancelled movementCancelled: Bool) -> UICollectionViewLayoutInvalidationContext
}
