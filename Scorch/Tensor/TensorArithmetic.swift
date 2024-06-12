//
//  TensorArithmetic.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/8/24.
//



extension Tensor where T: TensorData & Numeric & FloatingPoint {
  static private func performOperation(_ lhs: Tensor<T>, _ rhs: Tensor<T>, _ operation: @escaping (T, T) -> T) -> Tensor<T> {
    switch shapeAlignment(lhs, rhs) {
    case .sameShape: return elementwiseOperation(lhs, rhs, operation: operation)
    case .broadcastAllowed: return broadcastOperation(lhs, rhs, operation: operation)
    case .invalidPair: fatalError("Shapes cannot be broadcast together: \(lhs.shape) and \(rhs.shape)")
    }
  }
  
  static private func elementwiseOperation(_ lhs: Tensor<T>, _ rhs: Tensor<T>, operation: @escaping (T, T) -> T) -> Tensor<T> {
    let resultData = zip(lhs.data, rhs.data).map(operation)
    return Tensor(data: resultData, shape: lhs.shape)
  }
  
  static private func broadcastOperation(_ lhs: Tensor<T>, _ rhs: Tensor<T>, operation: @escaping (T, T) -> T) -> Tensor<T> {
    return Tensor._broadcastOperation(lhs, rhs, operation: operation)
  }
  
  static func +(_ lhs: Tensor<T>, _ rhs: Tensor<T>) -> Tensor<T> { return performOperation(lhs, rhs, +) }
  static func -(_ lhs: Tensor<T>, _ rhs: Tensor<T>) -> Tensor<T> { return performOperation(lhs, rhs, -) }
  static func *(_ lhs: Tensor<T>, _ rhs: Tensor<T>) -> Tensor<T> { return performOperation(lhs, rhs, *) }
  static func /(_ lhs: Tensor<T>, _ rhs: Tensor<T>) -> Tensor<T> { return performOperation(lhs, rhs, /) }

}
