//
//  RandomTests.swift
//  ScorchTests
//
//  Created by Michael Tamburello on 6/7/24.
//

import XCTest
@testable import Scorch

final class RandomTests: XCTestCase {
  
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
  
  
  
  func testRandomFloatGeneratorDistribution() {
    let sampleSize = 10000
    var sum: Float = 0
    var sumOfSquares: Float = 0
    for _ in 1...sampleSize {
      let number: Float = Float.random(in: 0...1)
      sum += number
      sumOfSquares += number * number
    }
    let mean = sum / Float(sampleSize)
    let variance = sumOfSquares / Float(sampleSize) - mean * mean
    // Check if the mean is close to 0 and variance close to 1
//    XCTAssertEqual(mean, 0, accuracy: 0.1, "Mean should be close to 0")
//    XCTAssertEqual(variance, 1, accuracy: 0.1, "Variance should be close to 1")
  }
}
