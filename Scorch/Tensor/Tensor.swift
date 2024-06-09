//
//  Tensor.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/6/24.
//

import Foundation
public struct Tensor<T: TensorData> {
  var data: [T]
  var shape: [Int]
  var strides: [Int]
  
  // Subscript for indexing the tensor with multiple dimensions
  public subscript(indices: Int...) -> T {
    get {
      let index = calculateIndex(indices: indices)
      return data[index]
    }
    set {
      let index = calculateIndex(indices: indices)
      data[index] = newValue
    }
  }
  
  public func element(at index: [Int]) -> T {
    var flatIndex = 0
    for (i, idx) in index.enumerated() {
      flatIndex += idx * strides[i]
    }
    return data[flatIndex]
  }
  
  // Calculate flat array index from multi-dimensional indices
  private func calculateIndex(indices: [Int]) -> Int {
    assert(indices.count == shape.count, "Index count does not match shape dimensions.")
    return indices.enumerated().reduce(0) { $0 + $1.element * strides[$1.offset] }
  }
}

extension Tensor: CustomStringConvertible {
  public var description: String {
    return "\(self.nestedArray())"
  }
}
