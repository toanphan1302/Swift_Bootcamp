//
//  SliderTableViewCell.swift
//  TableView
//
//  Created by Toan on 8/25/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mySlider.minimumValue = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        let range = (self.mySlider.maximumValue - self.mySlider.minimumValue)
        let value = (self.mySlider.value - self.mySlider.minimumValue)/range
        switch value {
        case 0...0.5:
            self.cellLabel.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: CGFloat(1 - value))
        case 0.5...1:
            self.cellLabel.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(value))
        default:
            self.cellLabel.backgroundColor = .white
        }
    }
}
