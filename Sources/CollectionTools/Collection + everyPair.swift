//
//  Collection + everyPair.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-06-20.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import Foundation
import FunctionTools



public extension Collection {
    
    /// Turns this collection into a lazy sequence of every element paired up with every element.
    ///
    /// - Note: Since this doesn't require the elements to be `Equatable`, each element will also be paired up with
    ///         itself once. If you don't want this, use `everyPairWithoutDuplicates`
    var everyPair: EveryPair {
        self.lazy.map { leftElement in
            self.lazy.map { rightElement in
                (leftElement, rightElement)
            }
        }
        .flatMap(echo)
    }
    
    
    /// Pairs up every element with every element and passes them to the given transformer, resulting in a collection
    /// of the transformed elements
    ///
    /// - Note: Since this doesn't require the elements to be `Equatable`, each element will also be paired up with
    ///         itself once. If you don't want this, use `mapEveryPairWithoutDuplicates`
    ///
    /// - Parameter mapper: The function which maps each pair of elements to a new collection
    /// - Returns: A new collection of the elements you transformed this one into
    func mapEveryPair
        <ProcessedElement>
        (_ mapper: @escaping Transformer<(Element, Element), ProcessedElement>)
        -> EveryPairMapped<ProcessedElement>
    {
        everyPair.map(mapper)
    }
    
    
    /// Turns this collection into a lazy sequence of every element paired up with every other element
    ///
    /// - Parameter equator: The function which will define equality
    func everyPairWithoutDuplicates(equatingBy equator: @escaping Transformer<(Element, Element), Bool>) -> EveryPairWithoutDuplicates {
        everyPair.filter(!equator)
    }
    
    
    /// Pairs up every element with every other element and passes them to the given transformer, resulting in a
    /// collection of the transformed elements
    ///
    /// - Parameter mapper: The function which maps each pair of elements to a new collection
    /// - Returns: A new collection of the elements you transformed this one into
    func mapEveryPairWithoutDuplicates
        <ProcessedElement>
        (
            equatingBy equator: @escaping Transformer<(Element, Element), Bool>,
            _ mapper: @escaping Transformer<(Element, Element), ProcessedElement>
        )
        -> EveryPairWithoutDuplicatesMapped<ProcessedElement>
    {
        everyPairWithoutDuplicates(equatingBy: equator)
            .map(mapper)
    }
    
    
    
    typealias EveryPairBase = FlattenSequence<
        LazyMapSequence<
            LazyMapSequence<
                Self,
                LazyMapSequence<
                    Self,
                    (Element, Element)
                >
            >,
            LazyMapSequence<
                Self,
                (Element, Element)
            >
        >
    >
    
    
    
    typealias EveryPair = LazySequence<EveryPairBase>
    typealias EveryPairMapped<ProcessedElement> = LazyMapSequence<EveryPairBase, ProcessedElement>
    typealias EveryPairWithoutDuplicates = LazyFilterSequence<EveryPairBase>
    typealias EveryPairWithoutDuplicatesMapped<ProcessedElement> = LazyMapSequence<EveryPairWithoutDuplicates, ProcessedElement>
}



public extension Collection where Element: Equatable {
    
    /// Turns this collection into a lazy sequence of every element paired up with every other element
    var everyPairWithoutDuplicates: EveryPairWithoutDuplicates {
        everyPair.filter(!=)
    }
    
    
    /// Pairs up every element with every other element and passes them to the given transformer, resulting in a
    /// collection of the transformed elements
    ///
    /// - Parameter mapper: The function which maps each pair of elements to a new collection
    /// - Returns: A new collection of the elements you transformed this one into
    func mapEveryPairWithoutDuplicates
        <ProcessedElement>
        (_ mapper: @escaping Transformer<(Element, Element), ProcessedElement>)
        -> EveryPairWithoutDuplicatesMapped<ProcessedElement>
    {
        everyPairWithoutDuplicates
            .map(mapper)
    }
}
