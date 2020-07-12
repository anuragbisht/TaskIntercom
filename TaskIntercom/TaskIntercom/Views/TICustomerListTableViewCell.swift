//
//  TICustomerListTableViewCell.swift
//  TaskIntercom
//
//  Created by Vikram Bisht on 7/10/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//

import UIKit

class TICustomerListTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var userIdLabel: UILabel!
  @IBOutlet weak var userNameLabel: UILabel!
  
  static let identifier = "TICustomerListTableViewCell"
 
  var customer:TICustomer?{
    didSet{
      userIdLabel.text = customer?.id.description;
      userNameLabel.text = customer?.name;
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
   
  }
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
}
