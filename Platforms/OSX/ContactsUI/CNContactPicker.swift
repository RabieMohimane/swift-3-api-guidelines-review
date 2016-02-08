
@available(OSX 10.11, *)
class CNContactPicker : Object {
  var displayedKeys: [String]
  weak var delegate: @sil_weak CNContactPickerDelegate?
  func showRelativeTo(positioningRect: Rect, of positioningView: NSView, preferredEdge: RectEdge)
  func close()
  init()
}