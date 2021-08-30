//
//  ViewController.swift
//  TableView
//
//  Created by Toan on 8/23/21.
//  Copyright © 2021 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Swift Navigation Controller"
        self.labelToChange.text = "Hellooooooo"
    }

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var progressButton: UIButton!
    @IBOutlet weak var labelToChange: UILabel!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!

    
    @IBAction func submitAction() {
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailedViewController")
        self.navigationController?.pushViewController(detailViewController, animated: true)
        // cannot hides, has to set it in the controller storyboard
        myIndicator.hidesWhenStopped = true
//        self.myIndicator.stopAnimating()

    }


    
    private var fontSize: CGFloat = 17.0
    @IBAction func changeMyLabel(){
        let newString = "\(self.labelToChange.text ?? "")?"
        fontSize += 0.5
// devide different range in the string
        let range1 = Int.random(in: 0 ..< newString.count)
        let range2 = Int.random(in: 0 ..< newString.count - range1)
        let range3 = newString.count - range1 - range2
        let NSrange2 = NSRange(location: range1, length: range2)
        let NSrange3 = NSRange(location: range1 + range2, length: range3)
        
//different fonts
        let font1 = UIFont(name: "American Typewriter", size: fontSize)
        let font2 = UIFont(name: "GillSans", size: fontSize)
        let font3 = UIFont(name: "CourierNewPSMT", size: fontSize)
//randomNumber for random color
        let randomNumber = CGFloat(Double.random(in: 0 ..< 1))
        let randomNumber2 = CGFloat(Double.random(in: 0 ..< 1))
        let randomNumber3 = CGFloat(Double.random(in: 0 ..< 1))
//different attributes
        let attributes1: [NSAttributedString.Key: Any] = [
            .font: font1 as Any,
            .backgroundColor: UIColor(red: randomNumber, green: randomNumber2, blue: randomNumber3, alpha: randomNumber)]
        let attributes2: [NSAttributedString.Key: Any] = [
            .font: font2 as Any,
            .backgroundColor: UIColor(red: randomNumber2, green: randomNumber, blue: randomNumber3, alpha: randomNumber)]
        let attributes3: [NSAttributedString.Key: Any] = [
            .font: font3 as Any,
            .backgroundColor: UIColor(red: randomNumber, green: randomNumber3, blue: randomNumber2, alpha: randomNumber)]
//load the attributes
        
        let myAttributedString = NSMutableAttributedString(string: newString, attributes: attributes1)
        myAttributedString.addAttributes(attributes2, range: NSrange2)
        myAttributedString.addAttributes(attributes3, range: NSrange3)
        
        self.labelToChange.attributedText = myAttributedString
        
    }
    
    @IBAction func startProgress(){
        for i in 1...100 {
            self.myIndicator.startAnimating()
            self.myIndicator.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now()+(Double(i)*0.1), execute: {self.myProgressView.setProgress(Float(i)/100, animated: true)
                print(self.myProgressView.progress)
                print(i)
                print(i/100)
                if i == 100 {
                    self.myIndicator.stopAnimating()
                    self.myIndicator.isUserInteractionEnabled = true
                }
                })
           }
        
//        self.myIndicator.stopAnimating()
//        self.myIndicator.isUserInteractionEnabled = true
    }

}

