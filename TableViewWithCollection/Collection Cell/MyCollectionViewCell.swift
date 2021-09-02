//
//  MyCollectionViewCell.swift
//  TableViewWithCollection
//
//  Created by Toan on 9/1/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configre(with model: Model){
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
        self.myImageView.contentMode = .scaleAspectFill
    }
}
