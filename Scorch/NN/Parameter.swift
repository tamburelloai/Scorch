//
//  Parameter.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/19/24.
//

import Foundation
import TensorKit



struct Parameter {
  var data: Tensor<Float>
  var grad: Tensor<Float>
  
  init(_ shape: [Int], initType: InitType, device: DeviceType = .cpu) {
    self.data = Parameter._initParamValues(shape: shape, initType: initType, device: device)
    self.grad = Parameter._initParamValues(shape: shape, initType: .zeros, device: device)
  }
  
  private static func _initParamValues(shape: [Int], initType: InitType, device: DeviceType) -> Tensor<Float> {
    switch initType {
    case .randomNormal: randn(shape).to(device)
    case .zeros: zeros(shape).to(device)
    }
  }
}
