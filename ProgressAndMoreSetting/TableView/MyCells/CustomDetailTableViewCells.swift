//
//  CustomDetailTableViewCells.swift
//  TableView
//
//  Created by Toan on 8/24/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class CustomDetailTableViewCells: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellLabel.backgroundColor = .red
    }

    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    
    @IBAction func switchChange(_ sender: UISwitch) {
        if sender.isOn {
            cellLabel.backgroundColor = .red
            let myString = cellLabel.text
            let removeRange = myString!.index(myString!.endIndex, offsetBy: -6)..<myString!.endIndex
            if (myString?[removeRange] == "(DONE)") {
                
                cellLabel.text?.removeSubrange(removeRange)
            }
        } else {
            cellLabel.backgroundColor = .green
            cellLabel.text? += " (DONE)"
        }
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        if (mySwitch.isOn) {
//            cellLabel.backgroundColor = .red
//        }
//        else {
//            cellLabel.backgroundColor = .green
//        }
        // Configure the view for the selected state
    }
    
}
