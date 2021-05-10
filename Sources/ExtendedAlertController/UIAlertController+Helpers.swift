//
//  UIAlertController+Helpers.swift
//  
//
//  Created by Kf on 2020/12/16.
//

import UIKit

// References: https://github.com/stringcode86/AlertViewController & https://github.com/dillidon/alerts-and-pickers
// UIAlertController does not support subclassing:  https://developer.apple.com/documentation/uikit/uialertcontroller

public enum TopViewLayout {
    case top
    case beyondTop
}

struct Constants {
    static var paddingAlert: CGFloat = 22
    static var paddingSheet: CGFloat = 11
    static func padding(for style: UIAlertController.Style) -> CGFloat {
        return style == .alert ? Constants.paddingAlert : Constants.paddingSheet
    }
}

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
    
    func add(topView: UIView, layout: TopViewLayout) {
        view.addSubview(topView)
        let padding = Constants.padding(for: preferredStyle)
        topView.center.x = view.bounds.width / 2.5 - 15
        switch layout {
        case .top:
            topView.center.y = padding + topView.bounds.size.height / 2
        case .beyondTop:
            topView.center.y = 0
        }
        adjustTitle(for: topView, padding: padding)
    }
}

// MARK: Fileprivate Methods
fileprivate extension UIAlertController {
    var lineHeight: CGFloat {
        let style: UIFont.TextStyle = preferredStyle == .alert ? .headline : .callout
        return UIFont.preferredFont(forTextStyle: style).pointSize
    }
    
    func newLinesCount(for view: UIView, padding: CGFloat) -> CGFloat {
        return ceil((view.center.y + view.bounds.size.height / 2 - padding) / lineHeight)
    }
    
    func adjustTitle(for view: UIView, padding: CGFloat) {
        let linesCount = Int(newLinesCount(for: view, padding: padding))
        let lines = (0..<linesCount).map({ _ in "\n" }).reduce("", +)
        title = lines + (title ?? "")
    }
}
