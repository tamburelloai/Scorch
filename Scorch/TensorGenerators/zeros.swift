//
//  zeros.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/7/24.
//

import Foundation

// External function to create a tensor filled with zeros
func zeros<T: TensorData>(shape: [Int]) -> Tensor<T> where T: Numeric, T: ExpressibleByIntegerLiteral {
  let totalElements = shape.reduce(1, *)
  let zerosData: [T] = Array(repeating: T.zero, count: totalElements)
  return Tensor(data: zerosData, shape: shape)
}

func zeros<T: TensorData>(_ shape: Int...) -> Tensor<T> where T: Numeric, T: ExpressibleByIntegerLiteral {
  zeros(shape: shape)
}