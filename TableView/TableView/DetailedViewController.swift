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
        
    
    }

    let names = ["Ben", "Jack", "Amy"]
    
}
extension DetailedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
        
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("You tapped me")
    }
}
