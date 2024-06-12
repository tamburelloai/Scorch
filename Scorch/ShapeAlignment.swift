//
//  ShapeAlignment.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/12/24.
//

import Foundation

enum ShapeAlignment {
  case sameShape
  case broadcastAllowed
  case invalidPair
}


func sameShape<T:TensorData&Numeric>(_ tensorA: Tensor<T>, _ tensorB: Tensor<T>) -> Bool {
  return tensorA.shape == tensorB.shape
}

func shapeAlignment<T:TensorData&Numeric>(_ tensorA: Tensor<T>, _ tensorB: Tensor<T>) -> ShapeAlignment {
  if sameShape(tensorA, tensorB) { return .sameShape }
  else if broadcastCompatible(tensorA, tensorB) { return .broadcastAllowed}
  else { return .invalidPair }
}
