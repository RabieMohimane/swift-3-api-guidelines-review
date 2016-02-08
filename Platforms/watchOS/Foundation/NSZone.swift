
func pageSize() -> Int
func logPageSize() -> Int
func roundUpToMultipleOfPageSize(bytes: Int) -> Int
func roundDownToMultipleOfPageSize(bytes: Int) -> Int
func allocateMemoryPages(bytes: Int) -> UnsafeMutablePointer<Void>
func deallocateMemoryPages(ptr: UnsafeMutablePointer<Void>, _ bytes: Int)
func copyMemoryPages(source: UnsafePointer<Void>, _ dest: UnsafeMutablePointer<Void>, _ bytes: Int)
@available(watchOS, introduced=2.0, deprecated=2.0)
func realMemoryAvailable() -> Int