//
//  Collection + everyPair.swift
//  
//
//  Created by Ben Leggiero on 2020-06-20.
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
        <ProcessedElement, ProcessedCollection>
        (_ mapper: Transformer<(Element, Element), ProcessedElement>)
        -> ProcessedCollection
        where ProcessedCollection: RangeReplaceableCollection,
            ProcessedCollection: CollectionWhichCanBeEmpty,
            ProcessedCollection.Element == ProcessedElement
    {
        everyPair.reduce(into: .init()) { (result, element) in
            result.append(mapper(element))
        }
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
        <ProcessedElement, ProcessedCollection>
        (_ mapper: Transformer<(Element, Element), ProcessedElement>)
        -> ProcessedCollection
        where ProcessedCollection: RangeReplaceableCollection,
            ProcessedCollection: CollectionWhichCanBeEmpty,
            ProcessedCollection.Element == ProcessedElement
    {
        everyPairWithoutDuplicates.reduce(into: .init()) { (result, element) in
            result.append(mapper(element))
        }
    }
    
    
    
    typealias EveryPairWithoutDuplicates = LazyFilterSequence<EveryPairBase>
}
