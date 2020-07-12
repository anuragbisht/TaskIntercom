//
//  TableViewCell.swift
//  TaskIntercom
//
//  Created by Vikram Bisht on 7/9/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var UserIdLabel: UILabel!
  @IBOutlet weak var UserNameLabel: UILabel!
  
  static let identifier = ""
  var customer:TICustomer{
    didSet{
      UserIdLabel.text = customer.id.description;
      UserNameLabel.text = customer.name;
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented");
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
