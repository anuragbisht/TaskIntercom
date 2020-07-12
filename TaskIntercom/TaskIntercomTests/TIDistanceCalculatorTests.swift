//
//  TIDistanceCalculatorTests.swift
//  TaskIntercomTests
//
//  Created by Vikram Bisht on 7/10/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//


import XCTest
@testable import TaskIntercom

class TIDistanceCalculatorTests: XCTestCase {
  
  let latitude = 0.0;
  let longitude = 0.0;
  var distanceCalculator:TIDistanceCalculator!
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    distanceCalculator = TIDistanceCalculator()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  
  
  func testDistanceCalculated(){
    distanceCalculator.startPoint = [latitude, longitude];
    print(Int(distanceCalculator.calculateDistance()));
    XCTAssert(Int(distanceCalculator.calculateDistance()) == 5959, "the value is \(Int(distanceCalculator.calculateDistance()))")
  }
}
