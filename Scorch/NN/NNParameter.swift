//
//  NNParameter.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/13/24.
//

import Foundation

enum ParamInitDist {
  case xavierUniform
  case xavierNormal
  case heUniform
  case heNormal
  case random
  case zeros
//  case kaimingUniform
//  case normal
}


struct NNParameter {
  var data: Tensor<Float>
  var grad: Tensor<Float>? = nil
  
  init (_ shape: Int...,  initDist: ParamInitDist = .random) {
    self.data = Tensor(data: NN.initializeParameters(shape, initDist), shape: shape)
    
  }
  
  static func placeholder() -> NNParameter {
    return NNParameter(0, initDist: .zeros)
  }
  
    
  /// Updates parameter (weight) values
  func update() {
    assert(self.grad != nil)
    //TODO: implement
  }
  
}
