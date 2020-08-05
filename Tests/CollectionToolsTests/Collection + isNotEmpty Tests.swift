//
//  Collection + isNotEmpty Tests.swift
//  
//
//  Created by Ben Leggiero on 2020-08-04.
//

import XCTest
import CollectionTools



final class Collection_plus_isNotEmpty_Tests: XCTestCase {
    
    func test_isNotEmpty() {
        XCTAssertFalse([].isNotEmpty)
        XCTAssertFalse([Int : Any]().isNotEmpty)
        XCTAssertFalse(([] as Set<Int>).isNotEmpty)
        XCTAssertFalse("".isNotEmpty)
        
        XCTAssertTrue([1].isNotEmpty)
        XCTAssertTrue([1, 2].isNotEmpty)
        XCTAssertTrue([1 : 2].isNotEmpty)
        XCTAssertTrue([1 : 2, 3 : false].isNotEmpty)
        XCTAssertTrue(([1] as Set).isNotEmpty)
        XCTAssertTrue(([1, 2] as Set).isNotEmpty)
        XCTAssertTrue("I'm not empty".isNotEmpty)
        
        
        let messages = [
            "Hey",
            "",
            "Have you heard?",
            "No",
            "You look nice today",
            "",
            "You know it's true",
            "Thank you",
        ]
        
        XCTAssertEqual(messages.filter(\.isNotEmpty), [
            "Hey",
            "Have you heard?",
            "No",
            "You look nice today",
            "You know it's true",
            "Thank you",
        ])
    }
    
    
    static let allTests = [
        ("test_isNotEmpty", test_isNotEmpty),
    ]
}
