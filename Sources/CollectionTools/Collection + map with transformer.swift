//
//  Collection + map with transformer.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-10-18.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import Foundation

import FunctionTools



public extension Sequence {
    
    /// Returns an array containing the results of mapping the given closure over the sequence’s elements.
    ///
    /// In this example, map is used first to convert the names in the array to lowercase strings
    ///
    /// ```
    /// let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    /// let lowercaseNames = cast.map(String.lowercased)
    /// // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
    /// ```
    ///
    /// - Parameter mapper: Accepts an element of this sequence as its parameter and returns a function which generates
    ///                     a transformed value of the same or of a different type.
    func map<ElementOfResult>(_ mapper: @escaping Transformer<Element, () -> ElementOfResult>)
    -> LazyMapSequence<Self, ElementOfResult> {
        lazy.map {
            mapper($0)()
        }
    }
}



public extension CollectionWhichCanBeEmpty
where Self: RangeReplaceableCollection
{
    /// Returns an array containing the results of mapping the given closure over the sequence’s elements.
    ///
    /// - Parameter mapper: Accepts an element of this sequence as its parameter and returns a function which generates
    ///                     a transformed value of the same or of a different type.
    func map<Result>(_ mapper: @escaping Transformer<Element, () -> Result.Element>)
    -> Result
    where Result: CollectionWhichCanBeEmpty,
          Result: RangeReplaceableCollection
    {
        var new = Result.init()
        new.reserveCapacity(count)
        forEach {
            new.append(mapper($0)())
        }
        return new
    }
}
