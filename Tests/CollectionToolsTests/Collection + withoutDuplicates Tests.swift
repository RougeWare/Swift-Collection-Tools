//
//  Collection + withoutDuplicates Tests.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-06-20.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools
import FunctionTools



final class Collection_plus_withoutDuplicates_Tests: XCTestCase {
    
    func test_Array_withoutDuplicates() {
        XCTAssertEqual([1, 1, 2, 3, 5].withoutDuplicates(), [1, 2, 3, 5])
        
        
        
        struct KindaEquatable {
            let value: Int
        }
        
        
        
        let kindaEquatableArray = [
            KindaEquatable(value: 1),
            KindaEquatable(value: 1),
            KindaEquatable(value: 2),
            KindaEquatable(value: 3),
            KindaEquatable(value: 5),
        ].withoutDuplicates(equatingBy: { $0.value == $1.value })
        
        XCTAssertEqual(kindaEquatableArray.count, 4)
        XCTAssertEqual(kindaEquatableArray[0].value, 1)
        XCTAssertEqual(kindaEquatableArray[1].value, 2)
        XCTAssertEqual(kindaEquatableArray[2].value, 3)
        XCTAssertEqual(kindaEquatableArray[3].value, 5)
    }
    
    
    func test_Set_withoutDuplicates() {
        XCTAssertEqual(Set([1, 1, 2, 3, 5]).withoutDuplicates(), [1, 2, 3, 5])
        
        let set = Set([1, 1, 2, 3, 5])
        XCTAssertEqual(set.withoutDuplicates(), set)
    }
    
    
    func test_String_withoutDuplicates() {
        XCTAssertEqual(
            "Lorem Ipsum".withoutDuplicates(),
            "Lorem Ipsu"
        )
    }
    
    
    static var allTests = [
        ("test_Array_withoutDuplicates", test_Array_withoutDuplicates),
        ("test_Set_withoutDuplicates", test_Set_withoutDuplicates),
        ("test_String_withoutDuplicates", test_String_withoutDuplicates),
    ]
}
