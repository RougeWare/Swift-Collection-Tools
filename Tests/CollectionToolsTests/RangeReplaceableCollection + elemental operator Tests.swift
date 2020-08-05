//
//  Collection + elemental operator Tests.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-04.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools



final class Collection_plus_elemental_operator_Tests: XCTestCase {
    
    func test_plus() {
        let fibonacciUpTo5 = [0, 1, 1, 2, 3, 5]
        let fibonacciUpTo8 = fibonacciUpTo5 + 8
        XCTAssertEqual(fibonacciUpTo5, [0, 1, 1, 2, 3, 5])
        XCTAssertEqual(fibonacciUpTo8, [0, 1, 1, 2, 3, 5, 8])
    }
    
    
    func test_plusEquals() {
        var fibonacci = [0, 1, 1, 2, 3, 5]
        XCTAssertEqual(fibonacci, [0, 1, 1, 2, 3, 5])
        fibonacci += 8
        XCTAssertEqual(fibonacci, [0, 1, 1, 2, 3, 5, 8])
    }
    
    
    static var allTests = [
        ("test_plus", test_plus),
        ("test_plusEquals", test_plusEquals),
    ]
}
