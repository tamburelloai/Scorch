//
//  NNModule.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/13/24.
//

import Foundation

/// The core foundation of the Neural Network Framework
/// - `training`: A boolean indicator of whether the module is in training or evaluation mode.
/// - `modules`: A dictionary of child modules.
/// - `parameters` A dictionary of module buffers.
/// - `buffers`:  A dictionary of module parameters.
protocol NNModule {
  var training: Bool { get set }
  var modules: [String: NNModule] { get }
  var parameters: [String: NNParameter] { get }
  var buffers: [String: NNBuffer] { get }
  
  /// Responsible for computing the forward pass
  /// - Parameter input: a `Tensor` that serves as model input during the forward pass
  /// - Returns: a `Tensor` that servers as the output of the model
  func forward<T: TensorData>(_ input: Tensor<T>) -> Tensor<T>
  
  /// Responsible for computing the backward pass
  /// - Parameter input: a `Tensor` that serves as model input during the backward pass
  /// - Returns: a `Tensor` that servers as the *nth* layers gradient wrt forward pass input
  func backward<T: TensorData>(_ input: Tensor<T>) -> Tensor<T>
  
  
  /// - convenient access to the complete list of Module (and all submodules) parameters
  /// - Returns: set of all parameters and submodule parameters
  func getParameters() -> [NNParameter]
  
  /// Convenient way to access model information such as parameters, metadata, etc.
  /// - Returns: set of associated variables representing the modules current state
  func stateDict() -> [String: Any]
}


