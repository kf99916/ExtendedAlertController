//
//  UIAlertController+Helpers.swift
//  
//
//  Created by Kf on 2020/12/16.
//

import UIKit

public extension UIAlertController {
    func set(viewController: UIViewController, height: CGFloat? = nil) {
        setValue(viewController, forKey: "contentViewController")
        if let height = height {
            viewController.preferredContentSize.height = height
            preferredContentSize.height = height
        }
    }
}
