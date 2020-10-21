import XCTest
import CollectionToolsTests

XCTMain([
    Collection_plus_everyPair_Tests.allTests,
    Collection_plus_isNotEmpty_Tests.allTests,
    Collection_plus_map_with_transformer_Tests.allTests,
    Collection_plus_nonEmptyOrNil_Tests.allTests,
    Collection_plus_onlyFirst_and_onlyLast_Tests.allTests,
    Collection_plus_withoutDuplicates_Tests.allTests,
    CollectionWhichCanBeEmpty_Tests.allTests,
    RangeReplaceableCollection_plus_elemental_operator_Tests.allTests,
    Sequence_plus_sequentialPairs_Tests.allTests,
])
