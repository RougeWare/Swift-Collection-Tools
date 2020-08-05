//
//  Collection + isNotEmpty.swift
//  CollectionTools
//
//  Created by Ben Leggiero on 2020-08-04.
//  Copyright © 2020 Ben Leggiero BH-1-PS
//

import Foundation



public extension Collection {
    
    /// Simply the inverse of `isEmpty`. Useful for terse, clear code.
    ///
    /// For example:
    /// ```swift
    /// messages.filter(\.isNotEmpty)
    /// ```
    /// ```swift
    /// welcomeText.hidden(username.isNotEmpty)
    /// ```
    @inline(__always)
    var isNotEmpty: Bool { !isEmpty }
}
