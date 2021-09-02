//
//  ViewController.swift
//  TableViewWithCollection
//
//  Created by Toan on 9/1/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet var table: UITableView!
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models.append(Model(text: "First", imageName: "Image_1"))
        models.append(Model(text: "second", imageName: "Image_2"))
        models.append(Model(text: "thrid", imageName: "Image_3"))
        models.append(Model(text: "demo", imageName: "Image_1"))
        models.append(Model(text: "something", imageName: "Image_4"))
        models.append(Model(text: "AnotherThing", imageName: "Image_4"))
        
        models.append(Model(text: "forth", imageName: "Image_1"))
        
        
        
        table.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
        table.delegate = self
        table.dataSource = self
    }
    
// Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as? CollectionTableViewCell
        cell?.configure(with: models)
        return cell ?? CollectionTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 250.0
    }
    
}
struct Model {
    let text: String
    let imageName: String
    init(text: String, imageName: String){
        self.text = text
        self.imageName = imageName
    }
}
