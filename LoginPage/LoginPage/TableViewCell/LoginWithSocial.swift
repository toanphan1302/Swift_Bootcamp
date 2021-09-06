//
//  LoginWithSocial.swift
//  LoginPage
//
//  Created by Toan on 9/5/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class LoginWithSocial: UITableViewCell {
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var facebookButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        buttonSetting()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//Button Setting
    func buttonSetting(){
        registerButton.layer.masksToBounds = true
        googleButton.layer.masksToBounds = true
        facebookButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 5
        googleButton.layer.cornerRadius = 5
        facebookButton.layer.cornerRadius = 5


    }
    
}
