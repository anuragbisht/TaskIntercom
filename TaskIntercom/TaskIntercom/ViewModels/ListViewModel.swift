//
//  ListViewModel.swift
//  TaskIntercom
//
//  Created by Vikram Bisht on 7/9/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//

import Foundation

class ListViewModel {
  enum ListType:Int {
    case all;
    case inRange;
  }
  var reloadTableViewClosure:(()->())?
  private var customerDataStore:Array<TICustomer> = [];
  public var listOfCustomers:Array<TICustomer> = []{
    didSet{
      reloadTableViewClosure?();
    }
  };
  let distanceToBeChecked:Double = 100.0
  let distanceCalculator = TIDistanceCalculator();
  let dataManager:TIDataManager
  
  init(dataManager:TIDataManager) {
    self.dataManager = dataManager;
  }
  
  private func fetchCustomersInRange(){
    var arr:Array<TICustomer> = [];
    for customer in customerDataStore{
      guard let lat  = Double(customer.latitude) else {return};
      guard let long = Double(customer.longitude) else {return};
      distanceCalculator.startPoint = [lat, long];
      if distanceCalculator.calculateDistance() < distanceToBeChecked{
        arr.append(customer);
      }
    }
    //sort the array
    arr.sort { (customer1, customer2) -> Bool in
      return customer1.id < customer2.id;
    }
    listOfCustomers = arr
  }
  
  
  private func fetchAllCustomers(){
    customerDataStore = dataManager.getCustomerList();
    listOfCustomers = customerDataStore;
    
  }
  func fetchCustomersWith( listType:ListType) {
    switch listType {
    case .inRange:
      fetchCustomersInRange()
      break
    case .all:
      fetchAllCustomers()
      break
    }
  }
}
