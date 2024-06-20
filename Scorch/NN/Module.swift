//
//  Module.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/19/24.
//

import Foundation
import TensorKit

class Module {
  var training: Bool
  var _parameters: OrderedDict<String, Parameter?>
  var _buffers: OrderedDict<String, Tensor<Float>?>
  var _modules: OrderedDict<String, Module?>
  
  init() {
    self.training = true
    self._parameters = OrderedDict<String, Parameter?>()
    self._buffers = OrderedDict<String, Tensor<Float>?>()
    self._modules = OrderedDict<String, Module?>()
    
  }
  
  // Placeholder forward method to be overridden by subclasses
  func forward(_ x: Tensor<Float>) -> Tensor<Float> {
    fatalError("Subclasses must implement the forward method.")
  }
  
  func _addModules() {
    let mirror = Mirror(reflecting: self)
    for child in mirror.children {
      if let childName = child.label, let module = child.value as? Module {
        self._modules[childName] = module
      }
    }
  }
}
