//
//  CollectionWhichCanBeEmpty Tests.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-06-20.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import XCTest
import CollectionTools
import FunctionTools



final class CollectionWhichCanBeEmpty_Tests: XCTestCase {
    
    func test_Array_CollectionWhichCanBeEmpty() {
        XCTAssertTrue(compiles([String]()))
        XCTAssertEqual([String].init(), [])
        XCTAssertEqual([String].empty, [])
        XCTAssertTrue([String]().isEmpty)
    }
    
    
    func test_Set_CollectionWhichCanBeEmpty() {
        XCTAssertTrue(compiles(Set<String>()))
        XCTAssertEqual(Set<String>.init(), [])
        XCTAssertEqual(Set<String>.empty, [])
        XCTAssertTrue(Set<String>().isEmpty)
    }
    
    
    func test_Dictionary_CollectionWhichCanBeEmpty() {
        XCTAssertTrue(compiles([String : String]()))
        XCTAssertEqual([String : String].init(), [:])
        XCTAssertEqual([String : String].empty, [:])
        XCTAssertTrue([String : String]().isEmpty)
    }
    
    
    func test_String_CollectionWhichCanBeEmpty() {
        XCTAssertTrue(compiles(String()))
        XCTAssertEqual(String.init(), "")
        XCTAssertEqual(String.empty, "")
        XCTAssertTrue(String().isEmpty)
    }
    
    
    static var allTests = [
        ("test_Array_CollectionWhichCanBeEmpty", test_Array_CollectionWhichCanBeEmpty),
        ("test_Set_CollectionWhichCanBeEmpty", test_Set_CollectionWhichCanBeEmpty),
        ("test_Dictionary_CollectionWhichCanBeEmpty", test_Dictionary_CollectionWhichCanBeEmpty),
        ("test_String_CollectionWhichCanBeEmpty", test_String_CollectionWhichCanBeEmpty),
    ]
}



private func compiles<C: CollectionWhichCanBeEmpty>(_: C) -> Bool { true }
