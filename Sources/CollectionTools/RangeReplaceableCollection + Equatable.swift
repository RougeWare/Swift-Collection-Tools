//
//  RangeReplaceableCollection + Equatable.swift
//  CollectionTools
//
//  Created by Ky Leggiero on 10/4/21.
//

import Foundation



public extension RangeReplaceableCollection where Element: Equatable {
    
    /// Removes and returns the element at the specified position.
    /// 
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    ///
    /// - Parameter element: The element to remove from this collection and its former position
    @discardableResult
    mutating func remove(firstInstanceOf element: Element) -> (element: Element, formerIndex: Index)? {
        if let firstIndex = self.firstIndex(of: element) {
            return (element: remove(at: firstIndex), formerIndex: firstIndex)
        }
        else {
            return nil
        }
    }
}
