//
//  Collection + map with transformer.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-10-19.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools
import FunctionTools



final class Collection_plus_map_with_transformer_Tests: XCTestCase {
    
    func test_map_Collection_to_Array() {
        XCTAssertEqual("LeArN tO cOdE".map(testToLowercase), [Character]("learn to code"))
        
        XCTAssertEqual(["Vivien", "Marlon", "Kim", "Karl"].map(String.lowercased), ["vivien", "marlon", "kim", "karl"])
    }
    
    
    func test_map_Collection_to_Self() {
        XCTAssertEqual("LeArN tO cOdE".map(testToLowercase), "learn to code")
    }
    
    
    func test_map_lazyToLazy() {
        XCTAssertEqual(String("LeArN tO cOdE".lazy.map(testToLowercase) as LazyMapSequence), "learn to code")
    }
    
    
    static var allTests = [
        ("test_map_Collection_to_Array", test_map_Collection_to_Array),
        ("test_map_Collection_to_Self", test_map_Collection_to_Self),
        ("test_map_lazyToLazy", test_map_lazyToLazy),
    ]
}



private func testToLowercase(_ character: Character) -> (() -> Character) {{
    character.lowercased().first!
}}
