//
//  Linear.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/13/24.
//

import Foundation



class Linear: NNModule {
  var parameters: NNParameter
  var device: DeviceType
  var phase: ModulePhase
  var activation: NNAct?
  
  init(_ inFeatures: Int, _ outFeatures: Int, bias: Bool = false, activation: NNAct? = nil, device: DeviceType = .cpu, phase: ModulePhase = .train) {
    self.parameters = NNParameter(inFeatures + (bias ? 1 : 0), outFeatures, initDist: .random)
    self.device = device
    self.phase = phase
    self.activation = activation
  }
  
  func forward(_ input: Tensor<Float>) -> Tensor<Float> {
    return rand(1)
  }
  
  func backward(_ input: Tensor<Float>) -> Tensor<Float> {
    return rand(1)
  }
  
  func getParameters() -> [NNParameter] {
    return []
  }
  
  func stateDict() -> [String : Any] {
    return [:]
  }
  
  
  
  
}
