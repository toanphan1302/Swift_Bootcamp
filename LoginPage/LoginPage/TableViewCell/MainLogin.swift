//
//  MainLogin.swift
//  LoginPage
//
//  Created by Toan on 9/5/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class MainLogin: UITableViewCell {
    
    @IBOutlet var email1: UITextField!
    @IBOutlet var email2: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        textFieldSetting()
        email1.delegate = self
        email2.delegate = self
        password.delegate = self
        label.text = "By signing up you accept the Term of service and Privacy policy"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldSetting(){

//        email1.becomeFirstResponder()
//        email2.becomeFirstResponder()
//        password.becomeFirstResponder()
        email1.returnKeyType = .done
        email2.returnKeyType = .done
        password.returnKeyType = .done
        email1.autocorrectionType = .no
        email2.autocorrectionType = .no
        password.autocorrectionType = .no
        password.isSecureTextEntry = true
    }

}
extension MainLogin: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.clearsOnBeginEditing = true
        return true
    }
    
}
