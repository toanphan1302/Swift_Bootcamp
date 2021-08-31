//
//  ViewController.swift
//  Textfield
//
//  Created by Toan on 8/30/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSetting()
        myTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped() {
        myTextField.resignFirstResponder()
    }
    
    func textFieldSetting() {
        myTextField.returnKeyType = .done
        myTextField.autocapitalizationType = .sentences
        myTextField.autocorrectionType = .default
        myTextField.becomeFirstResponder()
        
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let text = textField.text
        print("\(text ?? "")" )
        textField.clearsOnBeginEditing = true
        return true
    }
}


