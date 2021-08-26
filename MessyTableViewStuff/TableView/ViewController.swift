//
//  ViewController.swift
//  TableView
//
//  Created by Toan on 8/23/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Swift Navigation Controller"
    }


    @IBAction func submitAction() {
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailedViewController")
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

