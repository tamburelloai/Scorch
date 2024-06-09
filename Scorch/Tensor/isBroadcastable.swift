//
//  isBroadcastable.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/9/24.
//

import Foundation

extension Tensor {
  func _isBroadcastable(with other: Tensor) -> Bool {
    let selfDim = self.shape.count
    let otherDim = other.shape.count
    let maxDim = max(selfDim, otherDim)
    
    for i in 0..<maxDim {
      let selfSize = i < selfDim ? self.shape[selfDim - 1 - i] : 1
      let otherSize = i < otherDim ? other.shape[otherDim - 1 - i] : 1
      
      if !(selfSize == 1 || otherSize == 1 || selfSize == otherSize) {
        return false
      }
    }
    return true
  }
}


extension Tensor {
  /// TODO: `BROKEN`
  func expanded(to shape: [Int]) -> Tensor {
    // Check if there's any dimension with size zero which should not be the case
    assert(!shape.contains(0), "Shape cannot contain zero as any of its dimensions")
    
    // Calculate new strides
    var newStrides = [Int](repeating: 1, count: shape.count)
    for i in stride(from: shape.count - 2, through: 0, by: -1) {
      newStrides[i] = newStrides[i + 1] * shape[i + 1]
    }
    
    // Prepare new data with repeated zero
    var newData = [T](repeating: T.zero, count: shape.reduce(1, *))
    
    // Fill new data using old data by calculating indices according to new strides
    for i in 0..<newData.count {
      var indices = [Int](repeating: 0, count: shape.count)
      var idx = i
      for j in 0..<shape.count {
        indices[j] = Int((idx / newStrides[j]) % shape[j])
        idx /= newStrides[j]
      }
      newData[i] = self.element(at: indices)
    }
    
    return Tensor(data: newData, shape: shape, strides: newStrides)
  }
  
}

