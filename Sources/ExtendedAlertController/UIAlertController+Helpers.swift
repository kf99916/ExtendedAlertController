//
//  UIAlertController+Helpers.swift
//  
//
//  Created by Kf on 2020/12/16.
//

import UIKit

public extension UIAlertController {
    var backgroundColor: UIColor? {
        get {
            return view.subviews.first?.subviews.first?.subviews.first?.backgroundColor
        }
        set(backgroundColor) {
            view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = backgroundColor
        }
    }
    
    func set(viewController: UIViewController, height: CGFloat? = nil) {
        setValue(viewController, forKey: "contentViewController")
        if let height = height {
            viewController.preferredContentSize.height = height
            preferredContentSize.height = height
        }
    }
}
