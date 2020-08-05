//
//  Collection + onlyFirst & onlyLast.swift
//  
//
//  Created by Ben Leggiero on 2020-08-04.
//

import Foundation



public extension Collection {
    
    /// Returns a subsequence containing only the specified number of intial elements.
    ///
    /// If the number of elements to drop exceeds the number of elements in the collection, the result is a subsequence
    /// containing all elements.
    ///
    /// ```swift
    /// let numbers = [1, 2, 3, 4, 5]
    /// print(numbers.onlyFirst(2))
    /// // Prints "[1, 2]"
    /// print(numbers.onlyFirst(10))
    /// // Prints "[1, 2, 3, 4, 5]"
    /// ```
    ///
    /// - Complexity: O(1) if the collection conforms to RandomAccessCollection; otherwise, O(n), where n is the length of the collection.
    ///
    /// - Parameter k: The number of elements to keep at the beginning of the collection.
    ///                Must be greater than or equal to zero.
    @inline(__always)
    func onlyFirst(_ k: Int = 1) -> SubSequence {
        dropLast(Swift.max(0, count - k))
    }
    
    
    /// Returns a subsequence containing only the specified number of final elements.
    ///
    /// If the number of elements to drop exceeds the number of elements in the collection, the result is a subsequence
    /// containing all elements.
    ///
    /// ```swift
    /// let numbers = [1, 2, 3, 4, 5]
    /// print(numbers.onlyLast(2))
    /// // Prints "[4, 5]"
    /// print(numbers.onlyLast(10))
    /// // Prints "[1, 2, 3, 4, 5]"
    /// ```
    ///
    /// - Complexity: O(1) if the collection conforms to RandomAccessCollection; otherwise, O(n), where n is the length of the collection.
    ///
    /// - Parameter k: The number of elements to keep at the end of the collection.
    ///                Must be greater than or equal to zero.
    @inline(__always)
    func onlyLast(_ k: Int = 1) -> SubSequence {
        dropFirst(Swift.max(0, count - k))
    }
}
