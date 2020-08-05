//
//  Collection + isNotEmpty.swift
//  
//
//  Created by Ben Leggiero on 2020-08-04.
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
