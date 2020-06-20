//
//  CollectionWhichCanBeEmpty.swift
//  
//
//  Created by Ben Leggiero on 2020-06-20.
//

import Foundation



/// A collection which can be empty
public protocol CollectionWhichCanBeEmpty: Collection {
    
    /// Creates a new collection without anything in it
    init()
    
    
    /// A Boolean value indicating whether the collection is empty.
    ///
    /// When you need to check whether your collection is empty, use the
    /// `isEmpty` property instead of checking that the `count` property is
    /// equal to zero. For collections that don't conform to
    /// `RandomAccessCollection`, accessing the `count` property iterates
    /// through the elements of the collection.
    ///
    ///     let horseName = "Silver"
    ///     if horseName.isEmpty {
    ///         print("I've been through the desert on a horse with no name.")
    ///     } else {
    ///         print("Hi ho, \(horseName)!")
    ///     }
    ///     // Prints "Hi ho, Silver!")
    ///
    /// - Complexity: O(1)
    var isEmpty: Bool { get }
    
    
    /// An empty collection of this type
    static var empty: Self { get }
}



public extension CollectionWhichCanBeEmpty {
    static var empty: Self { Self.init() }
}



// MARK: - Default conformances

extension Array: CollectionWhichCanBeEmpty {}
extension Set: CollectionWhichCanBeEmpty {}
extension Dictionary: CollectionWhichCanBeEmpty {}
extension String: CollectionWhichCanBeEmpty {}
