//
//  Collection + nonEmptyOrNil.swift
//  
//
//  Created by Ben Leggiero on 2020-08-04.
//

import Foundation



public extension Collection {
    
    /// Iff this collection is empty, this returns `nil`. Else, it just returns itself
    ///
    /// ```swift
    /// return results.nonEmptyOrNil ?? backupResults
    /// ```
    /// ```swift
    /// guard let purples = colors.filter(\.isPurple).nonEmptyOrNil else {
    ///     assertionFailure("No purples!")
    ///     return .defaultPurple
    /// }
    /// ```
    @inlinable
    var nonEmptyOrNil: Self? {
        isEmpty ? nil : self
    }
}
