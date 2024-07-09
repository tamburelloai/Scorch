//
//  Linear.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/19/24.
//


//TODO: fix the Linear layer, and create the wrapper for requires_grad -> a superset of Tensor
//
import Foundation
import TensorKit

//TODO: Add support for bias=True



/// A traditional linear layer that performs a linear
/// transformation on the input
class Linear: Module {
  let inputSize: Int
  let outputSize: Int
  
  /// Initialization to store the the input/output sizes, initialize the super, and finally init the params
  init(_ inputSize: Int, _ outputSize: Int) {
    self.inputSize = inputSize
    self.outputSize = outputSize
    super.init()
    self._initParams()
  }
  
  /// adds the parameters of the module to the parameter dict defined by the super
  func _initParams() {
    self._parameters["weight"] = Parameter([inputSize, outputSize], initType: .randomNormal)
  }
  
  /// stores the input and calculates/returns the linear transformation
  override func forward(_ x: ScorchTensor) -> ScorchTensor {
    self._buffers["forwardPass"] = x
    var output: ScorchTensor = AutoGrad.matMul(x, self._parameters["weight"])
    return output
  }
  
  override func backward(_ runningGrad: ScorchTensor) {}
  
}
