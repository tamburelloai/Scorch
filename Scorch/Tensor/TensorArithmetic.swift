//
//  TensorArithmetic.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/8/24.
//

extension Tensor where T: TensorData & Numeric & FloatingPoint {
  // Generic function to apply an operation element-wise on two tensors
  static func elementWise(_ left: Tensor, _ right: Tensor, operation: (T, T) -> T) -> Tensor {
    assert(left.shape == right.shape, "Tensor shapes must be identical to perform element-wise operations")
    
    var resultData = Array(repeating: T.zero, count: left.data.count)
    for i in 0..<left.data.count {
      resultData[i] = operation(left.data[i], right.data[i])
    }
    
    return Tensor(data: resultData, shape: left.shape, strides: left.strides)
  }
  
  // Operator overloads using the generic element-wise function
  static func +(left: Tensor, right: Tensor) -> Tensor {
    return elementWise(left, right, operation: +)
  }
  
  static func -(left: Tensor, right: Tensor) -> Tensor {
    return elementWise(left, right, operation: -)
  }
  
  static func *(left: Tensor, right: Tensor) -> Tensor {
    return elementWise(left, right, operation: *)
  }
  
  static func /(left: Tensor, right: Tensor) -> Tensor {
    return elementWise(left, right) { a, b in
      // Ensure no division by zero
      assert(b != T.zero, "Division by zero encountered in tensor division")
      return a / b
    }
  }
}
