import Foundation
import TensorKit


class NN {}

// A class that is a node in the autograd reverse diff graph
//todo: make localGrdients optional and then for any input tensor if requiresGrad {perform gradient storage} default not requires and else nil then
// in the functions themselves, if requiresGrad store in local

class ScorchTensor : Hashable {
  var id: String; // Graph node (Variable) unique id
  var tensor: Tensor<Float> // the underlying tensor that is wrapped in a node object
  var localGradients: [(ScorchTensor, Tensor<Float>)] // The book-keeping allowing for recursive graph structure
  
  init(_ tensor: Tensor<Float>, localGradients: [(ScorchTensor, Tensor<Float>)] = []) {
    self.id = UUID().uuidString
    self.tensor = tensor
    self.localGradients = localGradients
  }
  
  /// Function required to conform to `Hashable` protocol
  static func == (lhs: ScorchTensor, rhs: ScorchTensor) -> Bool { return lhs.id == rhs.id }
  
  /// Function required to conform to `Hashable` protocol
  func hash(into hasher: inout Hasher) { hasher.combine(id) }
}



