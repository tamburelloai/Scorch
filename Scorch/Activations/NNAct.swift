//
//  NNAct.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/13/24.
//

import Foundation

enum NNAct {
  case ReLU
  case leakyReLU
  case sigmoid
  case tanh
  
  func apply(_ input: Tensor<Float>) -> Tensor<Float> {
    switch self {
    case .ReLU: return self._ReLU(input)
    case .leakyReLU: return self._leakyReLU(input)
    case .sigmoid: return self._sigmoid(input)
    case .tanh: return self._tanh(input)
    }
  }
}
