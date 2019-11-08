import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
	[testCase(KeyboardTests.allTests)]
}
#endif
