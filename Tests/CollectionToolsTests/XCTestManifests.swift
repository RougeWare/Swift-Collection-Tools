import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Collection_plus_everyPair_Tests.allTests),
        testCase(Collection_plus_isNotEmpty_Tests.allTests),
        testCase(Collection_plus_map_with_transformer_Tests.allTests),
        testCase(Collection_plus_nonEmptyOrNil_Tests.allTests),
        testCase(Collection_plus_onlyFirst_and_onlyLast_Tests.allTests),
        testCase(Collection_plus_withoutDuplicates_Tests.allTests),
        testCase(CollectionWhichCanBeEmpty_Tests.allTests),
        testCase(RangeReplaceableCollection_plus_elemental_operator_Tests.allTests),
        testCase(Sequence_plus_sequentialPairs_Tests.allTests),
    ]
}
#endif
