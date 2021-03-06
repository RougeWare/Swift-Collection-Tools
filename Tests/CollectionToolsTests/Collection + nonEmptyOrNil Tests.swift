//
//  Collection + nonEmptyOrNil Tests.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-04.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools



final class Collection_plus_nonEmptyOrNil_Tests: XCTestCase {
    func test_nonEmptyOrNil() {
        XCTAssertNil([].nonEmptyOrNil)
        XCTAssertNil([Int : Any]().nonEmptyOrNil)
        XCTAssertNil(([] as Set<Int>).nonEmptyOrNil)
        XCTAssertNil("".nonEmptyOrNil)
        
        XCTAssertNotNil([1].nonEmptyOrNil)
        XCTAssertNotNil([1, 2].nonEmptyOrNil)
        XCTAssertNotNil([1 : 2].nonEmptyOrNil)
        XCTAssertNotNil([1 : 2, 3 : false].nonEmptyOrNil)
        XCTAssertNotNil(([1] as Set).nonEmptyOrNil)
        XCTAssertNotNil(([1, 2] as Set).nonEmptyOrNil)
        XCTAssertNotNil("I'm not empty".nonEmptyOrNil)
        
        
        XCTAssertNil([1, 3, 5, 7].filter(\.isEven).nonEmptyOrNil)
        XCTAssertNotNil([1, 2, 3, 4].filter(\.isEven).nonEmptyOrNil)
    }
    
    
    static let allTests = [
        ("test_nonEmptyOrNil", test_nonEmptyOrNil),
    ]
}



private extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
}
