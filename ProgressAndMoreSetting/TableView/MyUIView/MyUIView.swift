//
//  MyUIView.swift
//  TableView
//
//  Created by Toan on 8/25/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class MyUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func instanceFromNib() -> MyUIView {
        let view = UINib(nibName: "MyUIView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MyUIView
        view.setupView(width: 414, height: 200)
        return view
    }
    
    func setupView(width: CGFloat, height: CGFloat){
        self.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    

    
    @IBOutlet weak var mySlider: UISlider!
    
    
}
