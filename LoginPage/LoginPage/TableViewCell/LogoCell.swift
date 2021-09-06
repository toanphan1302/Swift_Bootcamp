//
//  LogoCell.swift
//  LoginPage
//
//  Created by Toan on 9/5/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class LogoCell: UITableViewCell {
    
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var label: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.text = "Please register to continuous & enjoy shop"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
