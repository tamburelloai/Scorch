//
//  onesTests.swift
//  ScorchTests
//
//  Created by Michael Tamburello on 6/8/24.
//

import XCTest
@testable import Scorch

final class onesTests: XCTestCase {
  
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
  
  func testTensorOnes() {
    // testing individual integer init
    let M: Int = Int.random(in: 1...10)
    let N: Int = Int.random(in: 1...10)
    let tensor: Tensor<Int> = ones(M, N)
    XCTAssertEqual(tensor.shape, [M, N])
    XCTAssertEqual(tensor.data.count, M*N)
    XCTAssertEqual(tensor.data.reduce(0, +), M*N)
    // testing (multiple) array of integers init
    for i in 1...3 {
      // Generate a shape list with 'i' dimensions, each size between 1 and 5
      let shapeList = (1...i).map { _ in Int.random(in: 1...5) }
      let productOfShapeList = shapeList.reduce(1, *)
      let tensor: Tensor<Float> = ones(shape: shapeList)
      let sumOfOnes: Float = tensor.data.reduce(0, +)
      XCTAssertEqual(tensor.shape, shapeList)
      XCTAssertEqual(tensor.data.count, productOfShapeList)
      XCTAssertEqual(sumOfOnes, Float(productOfShapeList))
    }
  }
  
}