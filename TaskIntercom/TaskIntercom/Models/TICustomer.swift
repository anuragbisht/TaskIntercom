//
//  TICustomer.swift
//  TaskIntercom
//
//  Created by Vikram Bisht on 7/9/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//

import Foundation

struct TICustomer:Codable{
  var id:Int
  var name:String
  var latitude:String
  var longitude:String
  
  enum CodingKeys : String,CodingKey{
    case latitude
    case id = "user_id"
    case name
    case longitude
  }
  
}
