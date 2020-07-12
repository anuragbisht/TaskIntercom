//
//  ViewController.swift
//  TaskIntercom
//
//  Created by Vikram Bisht on 7/7/20.
//  Copyright © 2020 Anruag Bisht. All rights reserved.
//



/*
 FORMULAE =>
 λ1 = longitude of location1 in radians
 ϕ1 = latitude  of location1 in radians
 λ2 = longitude of location2 in radius
 ϕ2 = latitude of location2 in radius
 
 Δλ = |λ1-λ2|   (absolute val)
 Δϕ = |ϕ1-ϕ2|  (absolute val)
 Δσ = the central angle between the locations, which is callccuulated by the spherical law of cosines if one of the poles is used as an auxiliary third point on the sphere (in radians)
 Δσ = arccos⁡ ( sinϕ1 sinϕ2 + cosϕ1 cosϕ2 cos(Δλ))
 The actual arc length d on a sphere of radius r can be trivially computed as
 d = rΔσ
 
 */


import UIKit
import CoreLocation

class ViewController: UIViewController {
  
  // MARK: OUTLETS
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: VARIABLES
  
  var viewModel: ListViewModel? = {
    guard let url = Bundle.main.url(forResource: "Input", withExtension: "txt") else{return nil};
    let viewModel  = ListViewModel(dataManager: TIDataManager(filePath: url))
    return viewModel
  }();
  // MARK: VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.tableView.delegate  = self;
    self.tableView.dataSource  = self;
    self.tableView.register(UINib(nibName: TICustomerListTableViewCell.identifier, bundle: .main), forCellReuseIdentifier: TICustomerListTableViewCell.identifier);
    
    viewModel?.reloadTableViewClosure = { [weak self] in
      //reload tableview
      self?.tableView.reloadData();
    }
    viewModel?.fetchCustomersWith(listType: .all);
    
  }
  
  
  @IBAction func customerTypeChange(_ sender: UISegmentedControl) {
    viewModel?.fetchCustomersWith(listType: ListViewModel.ListType(rawValue: sender.selectedSegmentIndex) ?? .all);
  }
  
}
// MARK: TABLEVIEW DELEGATE & DATASOURCE
extension ViewController:  UITableViewDelegate, UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1;
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.listOfCustomers.count ?? 0;
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TICustomerListTableViewCell.identifier, for: indexPath) as? TICustomerListTableViewCell else {return UITableViewCell()}
    cell.customer = viewModel?.listOfCustomers[indexPath.row] ;
    return cell;
  }
}
