//
//  ViewController.swift
//  CollectionView
//
//  Created by Toan on 8/30/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellIdentifier = "CollectionViewCell"
    var items: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" , "17", "18", "19", "20","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" , "17", "18", "19", "20"]
        
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell
        cell?.layer.cornerRadius = 10.0
        cell?.clipsToBounds = true
        cell?.backgroundColor = .cyan
        cell?.myLabel.text = self.items[indexPath.row]
        return cell ??  CollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print("\(indexPath.row)")
        print("\(self.items[indexPath.row])")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        var heightAtIndexPath = 100
        
        switch indexPath.row % 3 {
        case 0:
            heightAtIndexPath = 100
        case 1:
            heightAtIndexPath = 150
        default:
            heightAtIndexPath = 200
        }
        
        return CGSize(width: Int(Float(self.view.frame.width/2) - 16), height: heightAtIndexPath)
    }
}


