//
//  isBroadcastable.swift
//  ScorchTests
//
//  Created by Michael Tamburello on 6/9/24.
//

import XCTest
@testable import Scorch

extension TensorTests {
  func testBroadcastabilitySameShape() {
    let x: Tensor<Float> = zeros(shape: [5, 7, 3])
    let y: Tensor<Float> = ones(shape: [5, 7, 3])
    let z: Tensor = x + y
    XCTAssert(z.data.reduce(0, +) == 5*7*3)
  }
  
  func testBroadcastabilitySmallerShape() {
    let x: Tensor<Float> = zeros(shape: [5, 3, 4, 1])
    let y: Tensor<Float> = ones(shape: [3, 1, 1])
    let z: Tensor = x + y
    XCTAssert(z.data.reduce(0, +) == 5*7*3)
  }
}
