import UIKit

// References: https://github.com/stringcode86/AlertViewController & https://github.com/dillidon/alerts-and-pickers

public enum TopViewLayout {
    case top
    case beyondTop
}

open class ExtendedAlertController: UIAlertController {
    private(set) var originalTitle: String?
    private var spaceAdjustedTitle: String?
    private var topView: UIView?
    private var previousTopViewSize: CGSize = .zero
    private var topViewLayout: TopViewLayout = .top
    
    private lazy var lineHeight: CGFloat = {
        let style: UIFont.TextStyle = self.preferredStyle == .alert ? .headline : .callout
        return UIFont.preferredFont(forTextStyle: style).pointSize
    }()
    
    open override var title: String? {
        didSet {
            if title != spaceAdjustedTitle {
                originalTitle = title
            }
        }
    }

    open override func viewDidLayoutSubviews() {
        guard let topView = topView else {
            super.viewDidLayoutSubviews()
            return
        }
        let padding = Constants.padding(for: preferredStyle)
        let size = topView.bounds.size
        let adjustWidth = view.bounds.width - 2 * padding
        topView.bounds.size = CGSize(width: adjustWidth, height: size.height * adjustWidth / size.width)
        
        topView.center.x = view.bounds.width / 2.0
        
        switch topViewLayout {
        case .top:
            topView.center.y = padding + topView.bounds.size.height / 2
        case .beyondTop:
            topView.center.y = 0
        }
        
        
        // Adjust title if top view size has changed
        if previousTopViewSize != topView.bounds.size {
            previousTopViewSize = topView.bounds.size
            adjustTitle(for: topView, padding: padding)
        }
        
        super.viewDidLayoutSubviews()
    }
}

// MARK: Open Methods
public extension ExtendedAlertController {
    func set(topView: UIView?, layout: TopViewLayout) {
        if let oldTopView = self.topView {
            oldTopView.removeFromSuperview()
        }
        
        topViewLayout = layout
        self.topView = topView
        if let topView = topView {
            view.addSubview(topView)
        }
    }
}

// MARK: Fileprivate Methods
fileprivate extension ExtendedAlertController {
    // Adds appropriate number of "\n" to `title` text to make space for `imageView`
    func adjustTitle(for view: UIView, padding: CGFloat) {
        let linesCount = Int(newLinesCount(for: view, padding: padding))
        let lines = (0..<linesCount).map({ _ in "\n" }).reduce("", +)
        spaceAdjustedTitle = lines + (originalTitle ?? "")
        title = spaceAdjustedTitle
    }
    
    // - Return: Number new line chars needed to make enough space for `imageView`
    func newLinesCount(for view: UIView, padding: CGFloat) -> CGFloat {
        return ceil((view.center.y + view.bounds.size.height / 4 + padding) / lineHeight)
    }
    
    struct Constants {
        static var paddingAlert: CGFloat = 22
        static var paddingSheet: CGFloat = 11
        static func padding(for style: UIAlertController.Style) -> CGFloat {
            return style == .alert ? Constants.paddingAlert : Constants.paddingSheet
        }
    }
}
