//
//  Collection + withoutDuplicates.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-06-21.
//  Copyright © Ben Leggiero 2020 BH-1-PS
//

import Foundation
import FunctionTools



public extension CollectionWhichCanBeEmpty where Self: RangeReplaceableCollection {
    /// Creates and returns a copy of this collection with all duplicate elements removed
    ///
    /// - Complexity: O((n/2) * (n+1))   (triangle numbers)
    ///
    /// - Parameter equator: The function which will define equality
    /// - Returns: A copy of this collection with all duplicate elements removed
    func withoutDuplicates(equatingBy equator: Transformer<(Element, Element), Bool>) -> Self {
        reduce(into: Self.empty) { withoutDuplicates, element in
            if !withoutDuplicates.contains(where: { equator(($0, element)) }) {
                withoutDuplicates.append(element)
            }
        }
    }
}



public extension CollectionWhichCanBeEmpty where
    Self: RangeReplaceableCollection,
    Element: Equatable
{
    /// Creates and returns a copy of this collection with all duplicate elements removed
    ///
    /// - Complexity: O((n/2) * (n+1))   (triangle numbers)
    ///
    /// - Returns: A copy of this collection with all duplicate elements removed
    func withoutDuplicates() -> Self {
        reduce(into: Self.empty) { withoutDuplicates, element in
            if !withoutDuplicates.contains(element) {
                withoutDuplicates.append(element)
            }
        }
    }
}



public extension SetAlgebra {
    /// Returns this set. Since sets don't have duplicates, no action is necessary.
    ///
    /// - Complexity: O(1)   (sets don't have duplicates)
    ///
    /// - Returns: This set
    @inlinable
    func withoutDuplicates() -> Self { self }
}
