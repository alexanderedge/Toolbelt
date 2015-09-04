//
//  Foundation.swift
//  Toolbelt
//
//  Created by Alexander Edge on 27/08/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import Foundation

extension Int {
    public static func random(range: Range<Int> ) -> Int {
        var offset = 0
        
        // allow negative ranges
        if range.startIndex < 0 {
            offset = abs(range.startIndex)
        }
        
        let mini = UInt32(range.startIndex + offset)
        let maxi = UInt32(range.endIndex + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
}

extension Bool {
    public static func random() -> Bool {
        return arc4random() < arc4random()
    }
}

extension CollectionType {
    public func shuffle() -> [Self.Generator.Element] {
        return sort(){ lhs, rhs in
            return Bool.random()
        }
    }
}

extension CollectionType where Index == Int, Generator.Element : Equatable {
    
    public func any(count : Int) -> [Self.Generator.Element] {
        guard !self.isEmpty else {
            return []
        }
        var indexes : [Int] = []
        for idx in 0..<self.count {
            indexes.append(idx)
        }
        indexes.shuffle()
        return 0.stride(to: count, by: 1).map({return self[$0]})
    }
    
    public func anyExcept(element : Self.Generator.Element) -> Self.Generator.Element? {
        guard self.count >= 2 else {
            return nil
        }
        var newElement = element
        while newElement == element {
            newElement = self.any!
        }
        return newElement
    }
    
    public var any: Self.Generator.Element? {
        guard !self.isEmpty else {
            return nil
        }
        return self[Int.random(0..<self.count)]
    }
    
}

extension Dictionary {
    public mutating func merge<K, V>(dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}

extension NSDate : Comparable {}

public func <(lhs : NSDate, rhs : NSDate) -> Bool {
    return [.OrderedAscending].contains(lhs.compare(rhs))
}

public func <=(lhs : NSDate, rhs : NSDate) -> Bool {
    return [.OrderedAscending,.OrderedSame].contains(lhs.compare(rhs))
}

public func >=(lhs : NSDate, rhs : NSDate) -> Bool {
    return [.OrderedDescending,.OrderedSame].contains(lhs.compare(rhs))
}

public func >(lhs : NSDate, rhs : NSDate) -> Bool {
    return [.OrderedDescending].contains(lhs.compare(rhs))
}
