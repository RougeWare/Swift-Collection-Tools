//
//  MutableCollection + mutateEach.swift
//  CollectionTools
//
//  Created by Ky Leggiero on 9/25/21.
//

import Foundation



public extension MutableCollection {
    
    /// Like `forEach`, but you can mutate each element too
    ///
    /// - Parameters:
    ///   - mutator: Iterates and mutates each element
    ///    - eachElement: Each element in this collection
    mutating func mutateEach(with mutator: (_ eachElement: inout Element) throws -> Void) rethrows {
        for index in indices {
            try mutator(&self[index])
        }
    }
}
