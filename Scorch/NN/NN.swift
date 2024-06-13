//
//  NN.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/13/24.
//

import Foundation

class NN {
  static func initializeParameters(_ shape: [Int], _ initDist: ParamInitDist) -> [Float] {
    switch initDist {
    case .xavierUniform: return NN.xavierUniform(shape)
    case .xavierNormal: return NN.xavierNormal(shape)
    case .heUniform: return NN.heUniform(shape)
    case .heNormal: return NN.heNormal(shape)
    case .random: return Array(repeating: Float.random(in: 0...1), count: shape.reduce(1, *))
    case .zeros: return Array(repeating: Float.zero, count: shape.reduce(1, *))
    }
    //TODO: normal
    //TODO: kaiming
  }
  
  // Xavier Uniform Initialization
  static func xavierUniform(_ shape: [Int]) -> [Float] {
    let limit = Float.squareRoot(6.0 / Float(shape.reduce(0, +)))
    return (0..<shape.reduce(1, *)).map { _ in Float.random(in: -limit()...limit()) }
  }
  
  // Xavier Normal Initialization
  static func xavierNormal(_ shape: [Int]) -> [Float] {
    let stddev = Float.squareRoot(2.0 / Float(shape.reduce(0, +)))
    return (0..<shape.reduce(1, *)).map { _ in Float.random(in: -stddev()...stddev()) }
  }
  
  // He Uniform Initialization
  static func heUniform(_ shape: [Int]) -> [Float] {
    assert(shape.count == 2, " heUniform Initialization Expected 2D tensor")
    let inputSize: Int = shape[0]
    let outputSize: Int = shape[1]
    let limit = Float.squareRoot(6.0 / Float(inputSize))
    return (0..<inputSize * outputSize).map { _ in Float.random(in: -limit()...limit()) }
  }
  
  // He Normal Initialization
  static func heNormal(_ shape: [Int]) -> [Float] {
    assert(shape.count == 2, " heNormal Initialization Expected 2D tensor")
    let inputSize: Int = shape[0]
    let outputSize: Int = shape[1]
    let stddev = Float.squareRoot(2.0 / Float(inputSize))
    return (0..<inputSize * outputSize).map { _ in Float.random(in: -stddev()...stddev()) }
  }
  
}


