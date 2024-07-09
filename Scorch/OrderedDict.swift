//
//  OrderedDict.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/20/24.
//

import Foundation

struct OrderedDict<Key: Hashable, Value> {
  private var keys: [Key] = []
  private var values: [Key: Value] = [:]
  
  var count: Int {
    return keys.count
  }
  
  var allKeys: [Key] {
    return keys
  }
  
  var allValues: [Value] {
    return keys.compactMap { values[$0] }
  }
  
  subscript(key: Key) -> Value? {
    get {
      return values[key]
    }
    set {
      if let newValue = newValue {
        if values[key] == nil {
          keys.append(key)
        }
        values[key] = newValue
      } else {
        values[key] = nil
        keys = keys.filter { $0 != key }
      }
    }
  }
}