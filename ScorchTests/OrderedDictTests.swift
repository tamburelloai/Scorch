//
//  OrderedDictTests.swift
//  ScorchTests
//
//  Created by Michael Tamburello on 6/20/24.
//

import Foundation
import XCTest
@testable import Scorch

class OrderedDictTests: XCTestCase {
  
  func testInitialization() {
    let orderedDict = OrderedDict<String, Int>()
    XCTAssertEqual(orderedDict.count, 0)
    XCTAssertTrue(orderedDict.allKeys.isEmpty)
    XCTAssertTrue(orderedDict.allValues.isEmpty)
  }
  
  func testInsertion() {
    var orderedDict = OrderedDict<String, Int>()
    orderedDict["one"] = 1
    XCTAssertEqual(orderedDict.count, 1)
    XCTAssertEqual(orderedDict.allKeys, ["one"])
    XCTAssertEqual(orderedDict.allValues, [1])
    
    orderedDict["two"] = 2
    XCTAssertEqual(orderedDict.count, 2)
    XCTAssertEqual(orderedDict.allKeys, ["one", "two"])
    XCTAssertEqual(orderedDict.allValues, [1, 2])
  }
  
  func testUpdateValue() {
    var orderedDict = OrderedDict<String, Int>()
    orderedDict["one"] = 1
    orderedDict["one"] = 10
    XCTAssertEqual(orderedDict.count, 1)
    XCTAssertEqual(orderedDict.allKeys, ["one"])
    XCTAssertEqual(orderedDict.allValues, [10])
  }
  
  func testRemoval() {
    var orderedDict = OrderedDict<String, Int>()
    orderedDict["one"] = 1
    orderedDict["two"] = 2
    XCTAssertEqual(orderedDict.count, 2)
    
    orderedDict["one"] = nil
    XCTAssertEqual(orderedDict.count, 1)
    XCTAssertEqual(orderedDict.allKeys, ["two"])
    XCTAssertEqual(orderedDict.allValues, [2])
    
    orderedDict["two"] = nil
    XCTAssertEqual(orderedDict.count, 0)
    XCTAssertTrue(orderedDict.allKeys.isEmpty)
    XCTAssertTrue(orderedDict.allValues.isEmpty)
  }
  
  func testSubscript() {
    var orderedDict = OrderedDict<String, Int>()
    orderedDict["one"] = 1
    XCTAssertEqual(orderedDict["one"], 1)
    XCTAssertNil(orderedDict["two"])
    
    orderedDict["two"] = 2
    XCTAssertEqual(orderedDict["two"], 2)
  }
  
  func testAllKeys() {
    var orderedDict = OrderedDict<String, Int>()
    orderedDict["one"] = 1
    orderedDict["two"] = 2
    orderedDict["three"] = 3
    XCTAssertEqual(orderedDict.allKeys, ["one", "two", "three"])
  }
  
  func testAllValues() {
    var orderedDict = OrderedDict<String, Int>()
    orderedDict["one"] = 1
    orderedDict["two"] = 2
    orderedDict["three"] = 3
    XCTAssertEqual(orderedDict.allValues, [1, 2, 3])
  }
  
  func testOrderPreservation() {
    var orderedDict = OrderedDict<String, Int>()
    orderedDict["b"] = 2
    orderedDict["a"] = 1
    orderedDict["c"] = 3
    XCTAssertEqual(orderedDict.allKeys, ["b", "a", "c"])
    XCTAssertEqual(orderedDict.allValues, [2, 1, 3])
  }
}

