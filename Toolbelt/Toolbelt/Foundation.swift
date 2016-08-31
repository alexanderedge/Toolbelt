//
//  Foundation.swift
//  Toolbelt
//
//  Created by Alexander Edge on 27/08/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import Foundation

extension Int {
    public static func random(_ range: Range<Int>) -> Int {
        var offset = 0
        
        // allow negative ranges
        if range.lowerBound < 0 {
            offset = abs(range.lowerBound)
        }
        
        let mini = UInt32(range.lowerBound + offset)
        let maxi = UInt32(range.upperBound + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
}

extension Bool {
    public static func random() -> Bool {
        return arc4random() < arc4random()
    }
}

extension Collection {
    public func shuffled() -> [Self.Iterator.Element] {
        return sorted(){ lhs, rhs in
            return Bool.random()
        }
    }
}

extension Collection where Self.Iterator.Element : Equatable {
    public func except(_ element : Self.Iterator.Element) -> [Self.Iterator.Element] {
        return self.filter({ (obj) -> Bool in
            return obj != element
        })
    }
}

extension Collection where Index == Int, Self.Iterator.Element : Equatable {
    
    public func any(_ count : Int) -> [Self.Iterator.Element] {
        guard !self.isEmpty else {
            return []
        }
        let indexes = 0..<self.endIndex
        let shuffledIndexes = indexes.shuffled()
        return  stride(from: 0, to: count, by: 1).map({return self[shuffledIndexes[$0]]})
    }
    
    public func anyExcept(_ element : Self.Iterator.Element) -> Self.Iterator.Element? {
        guard self.count >= 2 else {
            return nil
        }
        var newElement = element
        while newElement == element {
            newElement = self.any!
        }
        return newElement
    }
    
    public var any: Self.Iterator.Element? {
        guard !self.isEmpty else {
            return nil
        }
        return self[Int.random(0..<self.endIndex)]
    }
    
}

extension Dictionary {
    public mutating func merge<K, V>(_ dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}
