//
//  Sigmoid.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/13/24.
//

import Foundation
import TensorKit
import Metal



//TODO: Remove all support for anything but float.
//TODO: Create high level apis to simulate the ability to do bool or int. But always underlying FLoat




//extension NN {
//  struct Sigmoid: NNAct {
//    init() {}
//    
//    func forward(_ x: Tensor<Float>) -> Tensor<Float> {
//      switch x.device {
//      case .cpu: return self._cpu_forward(x)
//      case .mps: return self._mps_forward(x)
//      default: fatalError()
//      }
//    }
//    
//    func backward() -> Tensor<Float> {
//      return zeros(1)
//    }
//    
//    private func _cpu_forward<T:TensorData&FloatingPoint>(_ x: Tensor<T>) -> Tensor<T> { return zerosLike(x) }
//
//    private func _mps_forward<T:TensorData&FloatingPoint>(_ x: Tensor<T>) -> Tensor<T> {
//      var result: Tensor<T> = zerosLike(x)
//      guard let commandBuffer = MPSBackend.shared.commandQueue.makeCommandBuffer(),
//            let commandEncoder = commandBuffer.makeComputeCommandEncoder(),
//            let computePipelineState = MPSBackend.shared.getComputePipeline(for: "sigmoidForward") else {
//        fatalError("Failed to create command buffer or command encoder")
//      }
//      
//      commandEncoder.setComputePipelineState(computePipelineState)
//      commandEncoder.setBuffer(MPSBackend.shared.createBufferFromTensor(x), offset: 0, index: 0)
//      let resultBuffer: MTLBuffer = MPSBackend.shared.createBufferFromTensor(result)
//      commandEncoder.setBuffer(resultBuffer, offset: 0, index: 1)
//      
//      let threadCount: Int = result.data.count
//      let threadGroupSize = MTLSize(width: 256, height: 1, depth: 1) // This should divide the grid size without remainder.
//      let numThreadgroups = MTLSize(width: (threadCount + threadGroupSize.width - 1) / threadGroupSize.width, height: 1, depth: 1)
//      commandEncoder.dispatchThreadgroups(numThreadgroups, threadsPerThreadgroup: threadGroupSize)
//      commandEncoder.endEncoding()
//      commandBuffer.commit()
//      commandBuffer.waitUntilCompleted()
//      let resultPointer = resultBuffer.contents().bindMemory(to: Float.self, capacity: threadCount)
//      result.data = Array(UnsafeBufferPointer(start: resultPointer, count: threadCount)) as! [T]
//      result.device = x.device
//      return result
//    }
//  }
//}
