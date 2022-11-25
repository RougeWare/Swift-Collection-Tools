//
//  Collection + elemental operator Tests.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-04.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools



final class RangeReplaceableCollection_plus_elemental_operator_Tests: XCTestCase {
    
    func test_plusAppend() {
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
    
    
    func test_plusPrepend() {
        let fibonacciUpTo5 = [1, 1, 2, 3, 5]
        let fibonacciUpTo5_withZero = 0 + fibonacciUpTo5
        XCTAssertEqual(fibonacciUpTo5, [1, 1, 2, 3, 5])
        XCTAssertEqual(fibonacciUpTo5_withZero, [0, 1, 1, 2, 3, 5])
    }
    
    
    static var allTests = [
        ("test_plusAppend", test_plusAppend),
        ("test_plusPrepend", test_plusPrepend),
        ("test_plusEquals", test_plusEquals),
    ]
}
