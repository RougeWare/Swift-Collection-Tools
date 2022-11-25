//
//  RangeReplaceableCollection + elemental operators.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-04.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import Foundation



public extension RangeReplaceableCollection {
    
    /// Creates a new collection by concatenating the given element onto the end of the collection.
    ///
    /// The first argument's `Element` subtype must be the same type as the second element. For example, you can
    /// concatenate an integer onto an integer array.
    ///
    /// ```swift
    /// let fibonacciUpTo5 = [0, 1, 1, 2, 3, 5]
    /// let fibonacciUpTo8 = fibonacciUpTo5 + 8
    /// print(fibonacciUpTo8)
    /// // Prints "[0, 1, 1, 2, 3, 5, 8]"
    /// ```
    ///
    /// The resulting collection has the type of the argument on the left-hand side. In the example above,
    /// `fibonacciUpTo8` has the same type as `fibonacciUpTo5`, which is `[Int]`.
    ///
    /// - Parameters:
    ///   - collection: A range-replaceable collection.
    ///   - newElement: An element to go at the end of the new collection
    @inline(__always)
    static func +(_ collection: Self, _ newElement: Element) -> Self {
        collection + [newElement]
    }
    
    
    /// Appends the given element to a range-replaceable collection.
    ///
    /// Use this operator to append an element to the end of a range-replaceable collection whose elements are that
    /// same `Element` type. This example appends an `Int` to an array of integers:
    ///
    /// ```swift
    /// var fibonacci = [0, 1, 1, 2, 3, 5]
    /// fibonacci += 8
    /// print(fibonacci)
    /// // Prints "[0, 1, 1, 2, 3, 5, 8]"
    /// ```
    ///
    /// - Complexity: O(1)
    ///
    /// - Parameters:
    ///   - collection: A range-replaceable collection to append to.
    ///   - newElement: An element to go at the end of the collection
    @inline(__always)
    static func +=(_ collection: inout Self, _ newElement: Element) {
        collection += [newElement]
    }
    
    
    /// Creates a new collection by prepending the given element onto the end of the collection.
    ///
    /// The first argument's `Element` type must be the same type as the second element. For example, you can
    /// prepend an integer onto an integer array.
    ///
    /// ```swift
    /// let fibonacciUpTo5 = [1, 1, 2, 3, 5]
    /// let fibonacciUpTo5_withZero = 0 + fibonacciUpTo5
    /// print(fibonacciUpTo5_withZero)
    /// // Prints "[0, 1, 1, 2, 3, 5]"
    /// ```
    ///
    /// The resulting collection has the type of the argument on the right-hand side. In the example above,
    /// `fibonacciUpTo5_withZero` has the same type as `fibonacciUpTo5`, which is `[Int]`.
    ///
    /// - Parameters:
    ///   - newElement: An element to go at the beginning of the new collection
    ///   - collection: A range-replaceable collection.
    @inline(__always)
    static func +(_ newElement: Element, _ collection: Self) -> Self {
        [newElement] + collection
    }
}
