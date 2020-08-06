//
//  Collection + onlyFirst & onlyLast.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-04.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools



final class Collection_plus_onlyFirst_and_onlyLast_Tests: XCTestCase {
    
    func test_onlyFirst() {
        let numbers = [1, 2, 3, 4, 5]
        XCTAssertEqual(numbers.onlyFirst(0), [])
        XCTAssertEqual(numbers.onlyFirst(1), [1])
        XCTAssertEqual(numbers.onlyFirst(2), [1, 2])
        XCTAssertEqual(numbers.onlyFirst(3), [1, 2, 3])
        XCTAssertEqual(numbers.onlyFirst(4), [1, 2, 3, 4])
        XCTAssertEqual(numbers.onlyFirst(5), [1, 2, 3, 4, 5])
        XCTAssertEqual(numbers.onlyFirst(6), [1, 2, 3, 4, 5])
        XCTAssertEqual(numbers.onlyFirst(10), [1, 2, 3, 4, 5])
        
        XCTAssertEqual(numbers.onlyFirst(), [1])
    }
    
    
    func test_onlyLast() {
        let numbers = [1, 2, 3, 4, 5]
        XCTAssertEqual(numbers.onlyLast(0), [])
        XCTAssertEqual(numbers.onlyLast(1), [5])
        XCTAssertEqual(numbers.onlyLast(2), [4, 5])
        XCTAssertEqual(numbers.onlyLast(3), [3, 4, 5])
        XCTAssertEqual(numbers.onlyLast(4), [2, 3, 4, 5])
        XCTAssertEqual(numbers.onlyLast(5), [1, 2, 3, 4, 5])
        XCTAssertEqual(numbers.onlyLast(6), [1, 2, 3, 4, 5])
        XCTAssertEqual(numbers.onlyLast(10), [1, 2, 3, 4, 5])
        
        XCTAssertEqual(numbers.onlyLast(), [5])
    }
    
    
    static let allTests = [
        ("test_onlyFirst", test_onlyFirst),
        ("test_onlyLast", test_onlyLast),
    ]
}
