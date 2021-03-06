
typealias CGBitmapContextReleaseDataCallback = @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void
@available(watchOS 2.0, *)
func CGBitmapContextCreateWithData(_ data: UnsafeMutablePointer<Void>, _ width: Int, _ height: Int, _ bitsPerComponent: Int, _ bytesPerRow: Int, _ space: CGColorSpace?, _ bitmapInfo: UInt32, _ releaseCallback: CGBitmapContextReleaseDataCallback?, _ releaseInfo: UnsafeMutablePointer<Void>) -> CGContext?
@available(watchOS 2.0, *)
func CGBitmapContextCreate(_ data: UnsafeMutablePointer<Void>, _ width: Int, _ height: Int, _ bitsPerComponent: Int, _ bytesPerRow: Int, _ space: CGColorSpace?, _ bitmapInfo: UInt32) -> CGContext?
@available(watchOS 2.0, *)
func CGBitmapContextGetData(_ context: CGContext?) -> UnsafeMutablePointer<Void>
@available(watchOS 2.0, *)
func CGBitmapContextGetWidth(_ context: CGContext?) -> Int
@available(watchOS 2.0, *)
func CGBitmapContextGetHeight(_ context: CGContext?) -> Int
@available(watchOS 2.0, *)
func CGBitmapContextGetBitsPerComponent(_ context: CGContext?) -> Int
@available(watchOS 2.0, *)
func CGBitmapContextGetBitsPerPixel(_ context: CGContext?) -> Int
@available(watchOS 2.0, *)
func CGBitmapContextGetBytesPerRow(_ context: CGContext?) -> Int
@available(watchOS 2.0, *)
func CGBitmapContextGetColorSpace(_ context: CGContext?) -> CGColorSpace?
@available(watchOS 2.0, *)
func CGBitmapContextGetAlphaInfo(_ context: CGContext?) -> CGImageAlphaInfo
@available(watchOS 2.0, *)
func CGBitmapContextGetBitmapInfo(_ context: CGContext?) -> CGBitmapInfo
@available(watchOS 2.0, *)
func CGBitmapContextCreateImage(_ context: CGContext?) -> CGImage?
