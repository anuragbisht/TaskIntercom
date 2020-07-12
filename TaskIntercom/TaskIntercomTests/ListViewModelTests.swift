//
//  ListViewModelTests.swift
//  TaskIntercomTests
//
//  Created by Vikram Bisht on 7/10/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//

import XCTest
@testable import TaskIntercom

class ListViewModelTests: XCTestCase {
  var dataManager: TIDataManager!
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    guard let url = Bundle.main.url(forResource: "Input", withExtension: "txt") else{return};
    dataManager = TIDataManager(filePath: url);
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testCustomerFetching(){
    let viewModel  = ListViewModel(dataManager: dataManager)
    XCTAssert(viewModel.listOfCustomers.isEmpty, "list is not empty")
    viewModel.fetchCustomersWith(listType: .all)
    XCTAssert(!viewModel.listOfCustomers.isEmpty, "list of customers is empty")
    
    
  }
  
}
