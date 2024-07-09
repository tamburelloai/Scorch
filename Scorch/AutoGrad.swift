//
//  AutoGrad.swift
//  Scorch
//
//  Created by Michael Tamburello on 7/5/24.
//

import Foundation
import TensorKit

class AutoGrad {
  
  // a  `ScorchTensor` operation
  static func add(_ a: ScorchTensor, _ b: ScorchTensor) -> ScorchTensor {
    var result: Tensor<Float> = a.tensor + b.tensor
    var localGradients: [(ScorchTensor, Tensor<Float>)] = [(a, ones(like: a.tensor)), (b, ones(like: b.tensor))]
    return ScorchTensor(result, localGradients: localGradients)
  }
  
  // a  `ScorchTensor` operation
  static func mul(_ a: ScorchTensor, _ b: ScorchTensor) -> ScorchTensor {
    var result: Tensor<Float> = a.tensor * b.tensor
    var localGradients: [(ScorchTensor, Tensor<Float>)] = [(a, b.tensor), (b, a.tensor)]
    return ScorchTensor(result, localGradients: localGradients)
  }
  
  // a  `ScorchTensor` operation
  static func matMul(_ a: ScorchTensor, _ b: ScorchTensor) -> ScorchTensor {
    var result: Tensor<Float> = Tensor.matMul(a.tensor, b.tensor)
    var localGradients: [(ScorchTensor, Tensor<Float>)] = [(a, b.tensor), (b, a.tensor)]
    return ScorchTensor(result, localGradients: localGradients)
  }
  
  static func getGradients(_ ScorchTensor: ScorchTensor) -> DefaultDict<ScorchTensor, Tensor<Float>> {
    var gradients: DefaultDict<ScorchTensor, Tensor<Float>> = DefaultDict(defaultValue: zeros(like: ScorchTensor.tensor))
    func computeGradients(ScorchTensor: ScorchTensor, pathValue: Tensor<Float>) {
      for (childScorchTensor, localGradient) in ScorchTensor.localGradients {
        var valueOfPathToChild = pathValue * localGradient
        gradients[childScorchTensor] = gradients[childScorchTensor] + valueOfPathToChild
        computeGradients(ScorchTensor: childScorchTensor, pathValue: valueOfPathToChild)
      }
      
    }
    computeGradients(ScorchTensor: ScorchTensor, pathValue: ones(like: ScorchTensor.tensor))
    return gradients
  }
}
