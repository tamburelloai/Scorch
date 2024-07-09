//
//  Module.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/19/24.
//

import Foundation
import TensorKit

class Module {
  public var training: Bool // TODO: create getset functions
  var _parameters: OrderedDict<String, Parameter>
  var _buffers: OrderedDict<String, ScorchTensor>
  var _modules: OrderedDict<String, Module>
  
  init() {
    self.training = true
    self._parameters = OrderedDict<String, Parameter>()
    self._buffers = OrderedDict<String, ScorchTensor>()
    self._modules = OrderedDict<String, Module>()
    self._addModules()
  }
  
  func forward(_ x: ScorchTensor) -> ScorchTensor {
    fatalError("Subclasses must implement the forward method.")
  }
  
  func backward(_ grad: ScorchTensor) {
    fatalError("Subclasses must implement the backward method.")
  }
  
  func zeroGrad() {
    for parameter in self._parameters.allValues {
      parameter.zeroGrad()
    }
    for module in self._modules.allValues {
      module.zeroGrad()
    }
  }
  
  /// Allows for direct access of modules (instance attributes of type Module) for any module
  func _addModules() {
    let mirror = Mirror(reflecting: self)
    for child in mirror.children {
      if let childName = child.label, let module = child.value as? Module {
        self._modules[childName] = module
      }
    }
  }
}
