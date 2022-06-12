//
//  ArrayBuilderTests.swift
//  
//
//  Created by Ky Leggiero on 4/6/22.
//

import XCTest
import CollectionTools



func build<Element>(@ArrayBuilder<Element> _ builder: () -> [Element]) -> [Element] { builder() }



final class ArrayBuilderTests: XCTestCase {
    
    func testEmpty() {
        XCTAssertEqual([Int](), build {})
    }
    
    
    func testSingle() {
        XCTAssertEqual([1], build { 1 })
        XCTAssertEqual(["1"], build { "1" })
        XCTAssertEqual([nil] as [Int?], build { nil as Int? })
    }
    
    
    func testArray() {
        XCTAssertEqual([1, 2, 3, 4, 5, 6], build {
            [1, 2, 3, 4, 5, 6]
        })
    }
    
    
    func testArrays() {
        XCTAssertEqual([1, 2, 3, 4, 5, 6], build {
            [1, 2, 3]
            [4, 5, 6]
        })
    }
    
    
    func testVariableNumberOfElements() {
        XCTAssertEqual([1, 2, 3, 4, 5, 6], build {
            1
            2
            3
            4
            5
            6
        })
        
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], build {
            1
            2
            3
            4
            5
            6
            7
            8
            9
            10
            11
            12
            13
            14
            15
            16
            17
            18
            19
            20
        })
    }
    
    
    func testIf() {
        
        let three = 3
        
        XCTAssertEqual([1, 3], build {
            if true {
                1
            }
            if false {
                2
            }
            if 3 == three {
                three
            }
            if 4 == three {
                three
            }
        })
    }
    
    
    func testLimitedAvailability() {
        XCTAssertEqual([1, 4], build {
            if #available(iOS 1, macOS 1, macCatalyst 1, tvOS 1, watchOS 1, Windows 1, OpenBSD 1, *) {
                1
            }
            else {
                2
            }
            
            if #available(iOS 9999, macOS 9999, macCatalyst 9999, tvOS 9999, watchOS 9999, Windows 9999, OpenBSD 9999, *) {
                3
            }
            else {
                4
            }
        })
    }
    
    
    func testVariableNumberOfArrays() {
        XCTAssertEqual(
            [
                [1, 1, 1, 1, 1],
                [2, 2, 2, 2, 2],
                [3, 3, 3, 3, 3],
                [4, 4, 4, 4, 4],
                [5, 5, 5, 5, 5],
                [6, 6, 6, 6, 6]
            ],
            build {
                [1, 1, 1, 1, 1]
                [2, 2, 2, 2, 2]
                [3, 3, 3, 3, 3]
                [4, 4, 4, 4, 4]
                [5, 5, 5, 5, 5]
                [6, 6, 6, 6, 6]
            }
        )
        
        XCTAssertEqual(
            [
                [1, 1, 1, 1, 1],
                [2, 2, 2, 2, 2],
                [3, 3, 3, 3, 3],
                [4, 4, 4, 4, 4],
                [5, 5, 5, 5, 5],
                [6, 6, 6, 6, 6],
                [7, 7, 7, 7, 7],
                [8, 8, 8, 8, 8],
                [9, 9, 9, 9, 9],
                [10, 10, 10, 10, 10],
                [11, 11, 11, 11, 11],
                [12, 12, 12, 12, 12],
                [13, 13, 13, 13, 13],
                [14, 14, 14, 14, 14],
                [15, 15, 15, 15, 15],
                [16, 16, 16, 16, 16],
                [17, 17, 17, 17, 17],
                [18, 18, 18, 18, 18],
                [19, 19, 19, 19, 19],
                [20, 20, 20, 20, 20]
            ] as [[Int]],
            build {
                [1, 1, 1, 1, 1]
                [2, 2, 2, 2, 2]
                [3, 3, 3, 3, 3]
                [4, 4, 4, 4, 4]
                [5, 5, 5, 5, 5]
                [6, 6, 6, 6, 6]
                [7, 7, 7, 7, 7]
                [8, 8, 8, 8, 8]
                [9, 9, 9, 9, 9]
                [10, 10, 10, 10, 10]
                [11, 11, 11, 11, 11]
                [12, 12, 12, 12, 12]
                [13, 13, 13, 13, 13]
                [14, 14, 14, 14, 14]
                [15, 15, 15, 15, 15]
                [16, 16, 16, 16, 16]
                [17, 17, 17, 17, 17]
                [18, 18, 18, 18, 18]
                [19, 19, 19, 19, 19]
                [20, 20, 20, 20, 20]
            }
        )
    }
    
    
    func testEither() {
        let three = 3
        let seven = 7
        let eleven = 11
        
        XCTAssertEqual([1, 3, 7, 11], build {
            if true {
                1
            }
            else {
                2
            }
            
            if 3 == three {
                3
            }
            else if 4 == three {
                4
            }
            else {
                5
            }
            
            if 6 == seven {
                6
            }
            else if 7 == seven {
                7
            }
            else {
                8
            }
            
            if 3 == eleven {
                9
            }
            else if 10 == eleven {
                10
            }
            else {
                11
            }
        })
    }
    
    
    func testArrayThenElements() {
        XCTAssertEqual([1, 2, 3, 4, 5, 6], build {
            [1, 2, 3]
            4
            5
            6
        })
        
        XCTAssertEqual([0, 1, 2, 3, 4, 5, 6], build {
            0
            [1, 2, 3]
            4
            5
            6
        })
        
        XCTAssertEqual([0, 1, 2, 3, 4, 5, 6], build {
            0
            1
            [2, 3, 4]
            5
            6
        })
        
        XCTAssertEqual([0, 1, 2, 3, 4, 5, 6, 7, 8], build {
            0
            1
            2
            [3, 4, 5]
            6
            7
            8
        })
    }
}
