//
//  enum + OptionSet + CaseIterable.swift
//  Project Eve for iOS
//
//  Created by Ben Leggiero on 2020-07-16.
//  Copyright © 2020 PKWARE, Inc. All rights reserved.
//

import Foundation



public extension OptionSet
    where Self: CaseIterable,
          RawValue: BinaryInteger,
          AllCases.Element == Element
{
    /// Regenerates this option set by querying all the possible cases
    ///
    /// - Parameter rawValue: The desired raw value of this option set after reconstruction
    init(rawValue: RawValue) {
        self = []
        
        for option in Self.allCases
            where 0 != (rawValue & (1 << option.rawValue))
        {
            self.insert(option)
        }
    }
}
