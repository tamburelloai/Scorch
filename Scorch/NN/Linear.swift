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


class Linear: Module {
  let inputSize: Int
  let outputSize: Int
  let bias: Bool
  
  init(_ inputSize: Int, _ outputSize: Int, bias: Bool = true) {
    self.inputSize = inputSize
    self.outputSize = outputSize
    self.bias = bias
    super.init()
    self._parameters["weight"] = Parameter([inputSize, outputSize], initType: .randomNormal)
    if self.bias {
      self._parameters["bias"] = Parameter([1, outputSize], initType: .randomNormal)
    }
  }
  
  override func forward(_ x: NNTensor) -> NNTensor {
    self._buffers["forwardPass"] = x.tensor
    var output: Tensor<Float> = Tensor.matMul(x.tensor, self._parameters["weight"].data)
    if self.bias {
      output = output + self._parameters["bias"].data
    }
    return NNTensor(tensor: output, parentOp: self, isLeaf: false)
  }
  
  override func forward(_ x: Tensor<Float>) -> Tensor<Float> {
    self._buffers["forwardPass"] = x
    var output: Tensor<Float> = Tensor.matMul(x, self._parameters["weight"].data)
    if self.bias {
      output = output + self._parameters["bias"].data
    }
    return output
  }
  
  override func backward(_ runningGrad: NNTensor) {
  }
}
