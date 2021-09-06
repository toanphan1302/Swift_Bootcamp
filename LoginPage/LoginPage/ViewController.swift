//
//  ViewController.swift
//  LoginPage
//
//  Created by Toan on 9/5/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet var table: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "LogoCell", bundle: nil), forCellReuseIdentifier: "LogoCell")
        table.register(UINib(nibName: "MainLogin", bundle: nil), forCellReuseIdentifier: "MainLogin")
        table.register(UINib(nibName: "LoginWithSocial", bundle: nil), forCellReuseIdentifier: "LoginWithSocial")
        self.table.separatorStyle = UITableViewCell.SeparatorStyle.none
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: "LogoCell", for: indexPath) as! LogoCell
             cell.isUserInteractionEnabled = false
            
            return cell
        case 1:
             let cell = tableView.dequeueReusableCell(withIdentifier: "MainLogin", for: indexPath) as! MainLogin
            return cell
        case 2:
             let cell = tableView.dequeueReusableCell(withIdentifier: "LoginWithSocial", for: indexPath) as! LoginWithSocial
            return cell
        default:
            return UITableViewCell()
        }
    }
}

