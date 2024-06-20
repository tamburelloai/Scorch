//
//  SigmoidTests.swift
//  ScorchTests
//
//  Created by Michael Tamburello on 6/19/24.
//

import XCTest
import TensorKit
@testable import Scorch

final class SigmoidTests: XCTestCase {
  
//  override func setUpWithError() throws {
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//  }
//  
//  override func tearDownWithError() throws {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//  }
//  
//  func testExample() throws {
//    // This is an example of a functional test case.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    // Any test you write for XCTest can be annotated as throws and async.
//    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//  }
//  
//  func testPerformanceExample() throws {
//    // This is an example of a performance test case.
//    self.measure {
//      // Put the code you want to measure the time of here.
//    }
//  }
//  
//  func testLinearSigmoidActivationForward() {
//    let x: Tensor<Float> = Tensor([[ 0.0,  1.0,  2.0,  3.0,  4.0],
//                            [ 5.0,  6.0,  7.0,  8.0,  9.0],
//                            [10.0, 11.0, 12.0, 13.0, 14.0],
//                            [15.0, 16.0, 17.0, 18.0, 19.0],
//                            [20.0, 21.0, 22.0, 23.0, 24.0]]).to(.mps)
//    let correctForwardValues: Tensor<Float> = Tensor([[0.5000, 0.7311, 0.8808, 0.9526, 0.9820],
//                                      [0.9933, 0.9975, 0.9991, 0.9997, 0.9999],
//                                      [1.0000, 1.0000, 1.0000, 1.0000, 1.0000],
//                                      [1.0000, 1.0000, 1.0000, 1.0000, 1.0000],
//                                                      [1.0000, 1.0000, 1.0000, 1.0000, 1.0000]]).to(.mps)
//    let sigmoidLayer: NNAct = NN.Sigmoid()
//    let result: Tensor<Float> = sigmoidLayer.forward(x)
//    XCTAssertEqual(result.shape, correctForwardValues.shape)
//    XCTAssertEqual(result.device, x.device)
//    for i in (0..<result.data.count) {
//      XCTAssertEqual(result.data[i], correctForwardValues.data[i], accuracy: 0.999)
//    }
//
//    
//  }
//  
//  func testLinearSigmoidActivationBackward() {
//    let layer: Linear = Linear(10, 2, bias: false, activation: NN.Sigmoid()).to(.mps)
//    let x: Tensor = rand(1, 10).to(.mps)
//    let yhat: Tensor = layer.forward(x)
//    XCTAssert(yhat.shape == [1, 2])
//    XCTAssert(yhat.data.allSatisfy({$0 >= 0}))
//  }
}
