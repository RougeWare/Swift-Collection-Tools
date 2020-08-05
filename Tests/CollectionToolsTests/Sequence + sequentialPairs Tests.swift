//
//  Sequence + sequentialPairs Tests.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-02.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools



final class Collection_plus_sequentialPairs_Tests: XCTestCase {
    
    func test_sequentialPairs() {
        let pairs = Array(["A", "B", "C", "D", "E"].sequentialPairs)
        
        XCTAssertEqual(pairs.count, 4)
        XCTAssertEqual(pairs[0].0, "A"); XCTAssertEqual(pairs[0].1, "B")
        XCTAssertEqual(pairs[1].0, "B"); XCTAssertEqual(pairs[1].1, "C")
        XCTAssertEqual(pairs[2].0, "C"); XCTAssertEqual(pairs[2].1, "D")
        XCTAssertEqual(pairs[3].0, "D"); XCTAssertEqual(pairs[3].1, "E")
    }
    
    
    static var allTests = [
        ("test_sequentialPairs", test_sequentialPairs),
    ]
}
