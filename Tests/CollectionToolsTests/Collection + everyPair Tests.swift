//
//  Collection + everyPair Tests.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-06-20.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools
import FunctionTools



final class Collection_plus_everyPair_Tests: XCTestCase {
    
    func test_everyPair() {
        let testString = "Lorem"
        XCTAssertEqual(Array(testString.everyPair.map { String([$0.0, $0.1]) }), [
            "LL", "Lo", "Lr", "Le", "Lm",
            "oL", "oo", "or", "oe", "om",
            "rL", "ro", "rr", "re", "rm",
            "eL", "eo", "er", "ee", "em",
            "mL", "mo", "mr", "me", "mm",
        ])
    }
    
    
    func test_everyPairWithoutDuplicates() {
        let testString = "Lorem"
        XCTAssertEqual(Array(testString.everyPairWithoutDuplicates.map { String([$0.0, $0.1]) }), [
                  "Lo", "Lr", "Le", "Lm",
            "oL",       "or", "oe", "om",
            "rL", "ro",       "re", "rm",
            "eL", "eo", "er",       "em",
            "mL", "mo", "mr", "me",
        ])
    }
    
    
    func test_mapEveryPair() {
        let testString = "Lorem"
        XCTAssertEqual(testString.mapEveryPair { String([$0.0, $0.1]) }, [
            "LL", "Lo", "Lr", "Le", "Lm",
            "oL", "oo", "or", "oe", "om",
            "rL", "ro", "rr", "re", "rm",
            "eL", "eo", "er", "ee", "em",
            "mL", "mo", "mr", "me", "mm",
        ])
    }
    
    
    func test_mapEveryPairWithoutDuplicates() {
        let testString = "Lorem"
        XCTAssertEqual(testString.mapEveryPairWithoutDuplicates { String([$0.0, $0.1]) }, [
            "Lo", "Lr", "Le", "Lm",
            "oL",       "or", "oe", "om",
            "rL", "ro",       "re", "rm",
            "eL", "eo", "er",       "em",
            "mL", "mo", "mr", "me",
        ])
    }
    
    
    static var allTests = [
        ("test_everyPair", test_everyPair),
        ("test_everyPairWithoutDuplicates", test_everyPairWithoutDuplicates),
        ("test_mapEveryPair", test_mapEveryPair),
        ("test_mapEveryPairWithoutDuplicates", test_mapEveryPairWithoutDuplicates),
    ]
}
