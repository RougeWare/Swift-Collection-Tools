import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Collection_plus_everyPair_Tests.allTests),
        testCase(CollectionWhichCanBeEmpty_Tests.allTests),
    ]
}
#endif