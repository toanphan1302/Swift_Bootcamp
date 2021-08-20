//
//  ViewController.swift
//  NewUI
//
//  Created by Toan on 8/18/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yoLabel: UILabel!
    @IBOutlet weak var anotherLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        yoLabel.backgroundColor = .black
        anotherLabel.backgroundColor = .clear
        moreLabel.backgroundColor = .cyan
        
        yoLabel.layer.cornerRadius = 10.0
        moreLabel.lineBreakMode = .byWordWrapping
        yoLabel.clipsToBounds = true
        
        anotherLabel.layer.cornerRadius = 5.0
        anotherLabel.font = UIFont(name: "Helvetica", size: 21
        )
        anotherLabel.alpha = 0.5
        let url = URL(string: "www.google.com")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize:25),
            .foregroundColor: UIColor.red,
            .link: url!]
        
        
        anotherLabel.attributedText = NSAttributedString(string: "I am writing something", attributes: attributes)
        
        moreLabel.layer.cornerRadius = 3.0
        moreLabel.lineBreakMode = .byWordWrapping
    
    }


}

