//
//  DefaultDict.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/27/24.

import Foundation


/// A python like defaultdict like object that will allow gradient accumulation
struct DefaultDict<Key: Hashable, Value> {
  private var storage: [Key: Value] = [:]
  private let defaultValue: Value
  
  init(defaultValue: Value) {
    self.defaultValue = defaultValue
  }
  
  subscript(key: Key) -> Value {
    get {
      return storage[key] ?? defaultValue
    }
    set {
      storage[key] = newValue
    }
  }
  
  func contains(key: Key) -> Bool {
    return storage[key] != nil
  }
}
