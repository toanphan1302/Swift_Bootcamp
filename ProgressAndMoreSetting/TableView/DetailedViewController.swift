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
        self.tableView.register(UINib(nibName: "SliderTableViewCell", bundle: nil), forCellReuseIdentifier: sliderTableViewCell)
        
        self.tableView.tableHeaderView = createHeader()
//        self.tableView.tableFooterView = createFooter()
        

    }
    @IBOutlet weak var tableView: UITableView!
    let customTableViewCellIdentifier = "customTableViewCell"
    let cellReuseIdentifier = "cell"
    let sliderTableViewCell = "sliderTableViewCell"
    
    let tasks = ["Homework","Dishes","Laundry","Water the Plant Water the PlantWater the PlantWater the PlantWater the PlantWater the Plant"]
    
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
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = MyUIView.instanceFromNib()
//        footerView.mySlider.addTarget(self,  action:#selector(sliderValueChange(_:)), for: .valueChanged)
        return footerView
    }
    
//    @objc func sliderValueChange(_ sender: UISlider) {
//        let range = (self.mySlider.maximumValue - self.mySlider.minimumValue)
//        let value = (self.mySlider.value - self.mySlider.minimumValue)/range
//        switch value {
//        case 0...0.5:
//            self.cellLabel.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: CGFloat(1 - value))
//        case 0.5...1:
//            self.cellLabel.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(value))
//        default:
//            self.cellLabel.backgroundColor = .white
//        }
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
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellIdentifier, for: indexPath) as! CustomDetailTableViewCells
            cell.cellLabel.text = tasks[indexPath.row]
            return cell
        case 1...2:
            let cell = tableView.dequeueReusableCell(withIdentifier: sliderTableViewCell, for: indexPath) as! SliderTableViewCell
            cell.cellLabel.text = tasks[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) 
            cell.textLabel?.text = tasks[indexPath.row]
            return cell
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellIdentifier, for: indexPath) as! CustomDetailTableViewCells
//        cell.cellLabel.text = tasks[indexPath.row]
//        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("You tapped me")
    }
    
   
}
