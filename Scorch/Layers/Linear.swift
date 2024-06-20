//
//  Linear.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/19/24.
//

import Foundation
import TensorKit


/// Basic affine (or linear) layer
class Linear: Module {
  var in_features: Int
  var out_features: Int
  var weight: Parameter
  var bias: Parameter
  
  /// Default init
  /// - Parameters:
  ///   - in_features: input dim size (num features)
  ///   - out_features: output dim size
  init(in_features: Int, out_features: Int) {
    self.in_features = in_features
    self.out_features = out_features
    self.weight = Parameter([in_features, out_features], initType: .randomNormal)
    self.bias = Parameter([out_features], initType: .zeros)
    super.init()
    // Add weight and bias to the parameters dictionary
    self._parameters["weight"] = self.weight
    self._parameters["bias"] = self.bias
  }
  
  /// Forward pass
  /// - Parameter x (`Tensor`): input `Tensor`
  /// - Returns: transformed input of type `Tensor`
  override func forward(_ x: Tensor<Float>) -> Tensor<Float> {
    let output: Tensor<Float> = Tensor([1.0])
    return output
  }
}





