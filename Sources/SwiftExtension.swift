//
//  SwiftExtension.swift
//  SwiftExtension
//
//  Created by chansim.youk on {TODAY}.
//  Copyright © 2017 SwiftExtension. All rights reserved.
//

import Foundation

extension Sequence {
    /**
     Returns dictinary
     
     - Parameters:
        - keyProperty: Hashable type Property.
        - valueProperty: Value type of Dictinary.
        - combine: This combine origin value of dictinary and new value.
     
     ```
     struct Test {
        var key1: String
        var key2: String
        var value: Double
     }
     
     let tests = [
        Test(key1: "1", key2: "a", value: 1),
        Test(key1: "2", key2: "b", value: 2),
        Test(key1: "2", key2: "b", value: 2),
        Test(key1: "3", key2: "c", value: 3),
        Test(key1: "3", key2: "c", value: 3),
        Test(key1: "3", key2: "c", value: 3),
     ]
     
     ["1": 1, "2": 4, "3": 9]
     tests.groupBy({ $0.key1 }, { $0.value }, combine: +)
     
     ["a": 1, "b": 4, "c": 9]
     tests.groupBy({ $0.key2 }, { $0.value }, combine: +)
     ```
     
     - Returns: Returns Dictionary
     */
    func groupBy<K: Hashable, V>(_ keyProperty: @escaping (Self.Iterator.Element) -> K, _ valueProperty: @escaping (Self.Iterator.Element) -> V, combine: @escaping (V, V) -> V) -> [K: V] {
        var dict = [K: V]()
        forEach {
            let key = keyProperty($0)
            let value = valueProperty($0)
            
            if dict[key] == nil {
                dict[key] = value
            } else {
                if let v = dict[key] {
                    dict[key] = combine(v, value)
                }
            }
        }
        return dict
    }
}
