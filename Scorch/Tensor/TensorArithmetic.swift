//
//  TensorArithmetic.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/8/24.
//

//todo: refactor to handle elementwise vs broadcast elementwise
extension Tensor where T: TensorData & Numeric & FloatingPoint {
  static func elementWise(_ left: Tensor, _ right: Tensor, operation: (T, T) -> T) -> Tensor<T> {
    assert(left.shape == right.shape, "tensor a and tensor b must be same size be same size (got \(left.shape) and \(right.shape))")
    var resultData = Array(repeating: T.zero, count: left.data.count)
    for i in 0..<left.data.count {
      resultData[i] = operation(left.data[i], right.data[i])
    }
    return Tensor(data: resultData, shape: left.shape)
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
