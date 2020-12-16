//
//  ViewController.swift
//  ExtendedAlertControllerDemo
//
//  Created by Kf on 2020/12/16.
//

import UIKit
import ExtendedAlertController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: @IBAction Methods
extension ViewController {
    @IBAction func showTopView(sender: AnyObject) {
        let alertController = ExtendedAlertController(title: "Top View Alert", message: "😁", preferredStyle: .alert)
        let imageView = UIImageView(image: UIImage(named: "Check"))
        alertController.set(topView: imageView, layout: .top)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showBeyondTopView(sender: AnyObject) {
        let alertController = ExtendedAlertController(title: "Beyond Top View Alert", message: "😎", preferredStyle: .alert)
        let imageView = UIImageView(image: UIImage(named: "Check"))
        alertController.set(topView: imageView, layout: .beyondTop)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
