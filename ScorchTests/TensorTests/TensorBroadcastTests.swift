//
//  TensorBroadcastTests.swift
//  ScorchTests
//
//  Created by Michael Tamburello on 6/10/24.
//

import Foundation
import XCTest
@testable import Scorch

final class TensorBroadcastTests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testAllBroadcastCases() {
    let broadcastingResults: [(array1Shape: [Int], array2Shape: [Int], broadcastedShape: [Int]?, status: String, errorMessage: String?)] = [
      (array1Shape: [3], array2Shape: [3, 1], broadcastedShape: [3, 3], status: "success", errorMessage: nil),
      (array1Shape: [3], array2Shape: [2], broadcastedShape: nil, status: "error", errorMessage: "shape mismatch: objects cannot be broadcast to a single shape. Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2,)."),
      (array1Shape: [2, 2], array2Shape: [2], broadcastedShape: [2, 2], status: "success", errorMessage: nil),
      (array1Shape: [1], array2Shape: [3], broadcastedShape: [3], status: "success", errorMessage: nil),
      (array1Shape: [2, 2], array2Shape: [2, 1], broadcastedShape: [2, 2], status: "success", errorMessage: nil),
      (array1Shape: [3], array2Shape: [2, 2], broadcastedShape: nil, status: "error", errorMessage: "shape mismatch: objects cannot be broadcast to a single shape. Mismatch is between arg 0 with shape (3,) and arg 1 with shape (2, 2)."),
      (array1Shape: [4], array2Shape: [1, 4], broadcastedShape: [1, 4], status: "success", errorMessage: nil),
      (array1Shape: [1, 2, 2], array2Shape: [2, 1], broadcastedShape: [1, 2, 2], status: "success", errorMessage: nil),
      (array1Shape: [2], array2Shape: [4, 4], broadcastedShape: nil, status: "error", errorMessage: "shape mismatch: objects cannot be broadcast to a single shape. Mismatch is between arg 0 with shape (2,) and arg 1 with shape (4, 4)."),
      (array1Shape: [4, 2], array2Shape: [4, 3], broadcastedShape: nil, status: "error", errorMessage: "shape mismatch: objects cannot be broadcast to a single shape. Mismatch is between arg 0 with shape (4, 2) and arg 1 with shape (4, 3)."),
      (array1Shape: [4], array2Shape: [3, 1], broadcastedShape: [3, 4], status: "success", errorMessage: nil),
      (array1Shape: [3], array2Shape: [4, 3, 4], broadcastedShape: nil, status: "error", errorMessage: "shape mismatch: objects cannot be broadcast to a single shape. Mismatch is between arg 0 with shape (3,) and arg 1 with shape (4, 3, 4)."),
      (array1Shape: [1], array2Shape: [3, 1], broadcastedShape: [3, 1], status: "success", errorMessage: nil),
      (array1Shape: [1, 1, 2], array2Shape: [4], broadcastedShape: nil, status: "error", errorMessage: "shape mismatch: objects cannot be broadcast to a single shape. Mismatch is between arg 0 with shape (1, 1, 2) and arg 1 with shape (4,)."),
      (array1Shape: [4], array2Shape: [1], broadcastedShape: [4], status: "success", errorMessage: nil),
      (array1Shape: [4, 2], array2Shape: [1, 2, 2], broadcastedShape: nil, status: "error", errorMessage: "shape mismatch: objects cannot be broadcast to a single shape. Mismatch is between arg 0 with shape (4, 2) and arg 1 with shape (1, 2, 2).")
    ]
    for res in broadcastingResults {
      var shapeA: [Int] = res.array1Shape
      var dataA: [Float] = initZeros(shapeA)
      var tensorA: Tensor = Tensor(data: dataA, shape: shapeA)
      let shapeB: [Int] = res.array2Shape
      let dataB: [Float] = initZeros(shapeB)
      var tensorB: Tensor = Tensor(data: dataB, shape: shapeB)
      if res.status == "success" {
        let tensorC: Tensor = broadcastAdd(tensorA, tensorB)
        XCTAssertEqual(tensorC.shape, res.broadcastedShape!)
      } else if res.status == "error"{
        //TODO
        continue
      }
    }
  }
}
