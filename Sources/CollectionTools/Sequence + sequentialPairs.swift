//
//  Sequence + sequentialPairs.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-02.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import Foundation



public extension Sequence {
    /// Returns all the pairs in this sequence, in the order in which they appear.
    ///
    /// For example, given this array:
    /// ```swift
    /// ["A", "B", "C", "D", "E"].sequentialPairs
    /// ```
    ///
    /// This will give a sequence like this:
    /// ```swift
    /// [
    ///     ("A", "B"),
    ///     ("B", "C"),
    ///     ("C", "D"),
    ///     ("D", "E"),
    /// ]
    /// ```
    var sequentialPairs: Zip2Sequence<Self, DropFirstSequence<Self>> {
        zip(self, self.dropFirst())
    }
}
