//
//  DataManager.swift
//  TaskIntercom
//
//  Created by Vikram Bisht on 7/9/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//

import Foundation

class TIDataManager{
  let decoder = JSONDecoder();
  var listOfCustomers:Array<TICustomer> = [];
  var filePath:URL;
 
  init(filePath:URL){
    self.filePath = filePath;
  }
  
  
  func getCustomerList() ->  Array<TICustomer> {
    listOfCustomers = []
    do{
      let readText = try String(contentsOf: filePath, encoding: String.Encoding.utf8);
      let arr = readText.components(separatedBy: .newlines);
      for cus in arr {
        let customer = convertStringToCustomer(user: cus);
        if customer.id != 0{
          listOfCustomers.append(customer)
        }
      }
    }catch{
      print("could not read ");
    }
    return listOfCustomers;
  }
  
  func convertStringToCustomer(user:String)->TICustomer{
    var  customer  = TICustomer(id: 0, name: "", latitude: "0.0", longitude: "0.0")
    
    if let data  = user.data(using: .utf8){
      do {
        customer = try decoder.decode(TICustomer.self, from: data);
      }catch{
        print(error.localizedDescription);
      }
    }
    return customer;
  }
  
}
