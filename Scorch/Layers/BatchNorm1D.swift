//
//  BatchNorm1D.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/13/24.
//

import Foundation

class BatchNorm1d {
  let numFeatures: Int
  let epsilon: Float
  let momentum: Float
  var runningMean: Tensor<Float>?
  var runningVar: Tensor<Float>?
  var gamma: Tensor<Float>?
  var beta: Tensor<Float>?
  
  init(numFeatures: Int, epsilon: Float = 1e-5, momentum: Float = 0.1, affine: Bool = true, trackRunningStats: Bool = true) {
    self.numFeatures = numFeatures
    self.epsilon = epsilon
    self.momentum = momentum
    
    if trackRunningStats {
      self.runningMean = Tensor(data: Array(repeating: Float.zero, count: numFeatures), shape: [numFeatures])
      self.runningVar = Tensor(data: Array(repeating: Float(1.0), count: numFeatures), shape: [numFeatures])
    }
    
    if affine {
      self.gamma = Tensor(data: Array(repeating: Float(1.0), count: numFeatures), shape: [numFeatures])
      self.beta = Tensor(data: Array(repeating: Float(0.0), count: numFeatures), shape: [numFeatures])
    }
  }
  
  func forward(input: Tensor<Float>) -> Tensor<Float> {
//    guard let gamma = gamma, let beta = beta else {
//      fatalError("Affine parameters not initialized.")
//    }
//    //TODO: Implement this
//    let mean = input.mean(alongDimension: 0)
////    let variance = input.variance(alongDimension: 0, unbiased: false) + epsilon
//    
//    // Update running statistics if tracking
//    if let runningMean = runningMean, let runningVar = runningVar {
//      self.runningMean = momentum * runningMean + (1 - momentum) * mean
////      self.runningVar = momentum * runningVar + (1 - momentum) * variance
//    }
//    
//    let stdDev = variance.sqrt()
//    let normalizedInput = (input - mean) / stdDev
//    return normalizedInput * gamma + beta
    return zeros(1)
  }
}
