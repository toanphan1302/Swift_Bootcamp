//
//  DetailedViewController.swift
//  TableView
//
//  Created by Toan on 8/23/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Detailed View Controller"
        // UITablveView.self is just a setting for the cell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.register(UINib(nibName: "CustomDetailTableViewCells", bundle: nil), forCellReuseIdentifier: customTableViewCellIdentifier)
        
        self.tableView.tableHeaderView = createHeader()
        self.tableView.tableFooterView = createFooter()
        
    }
    @IBOutlet weak var tableView: UITableView!
    let customTableViewCellIdentifier = "customTableViewCell"
    let tasks = ["Homework","Dishes","Laundry","Water the Plant Water the PlantWater the PlantWater the PlantWater the PlantWater the Plant"]
    let cellReuseIdentifier = "cell"
}

    
extension DetailedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections (in tableView: UITableView) -> Int {
        return 2
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
    
    //-------------------------------------------------------------
    // header, footer
//    func tableView(_ tableView:UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
//        headerView.backgroundColor = .magenta
//        return headerView
//    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 70))
//        footerView.backgroundColor = .blue
//        return footerView
//    }
   func createHeader() -> UIView {
          let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
          headerView.backgroundColor = .magenta
          return headerView
      }
      func createFooter() -> UIView {
          let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 70))
          headerView.backgroundColor = .blue
          return headerView
      }
    
    //-----------------------------------------------------------
    // data
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellIdentifier, for: indexPath) as! CustomDetailTableViewCells
        cell.cellLabel.text = tasks[indexPath.row]
        return cell


    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("You tapped me")
    }
    
   
}
