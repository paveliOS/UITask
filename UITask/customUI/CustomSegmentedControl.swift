import UIKit

protocol CustomSegmentedControlDelegate: class {
    func selectedSegmentDidChange()
}

final class CustomSegmentedControl: UIView {
    
    @IBOutlet private var segments: [UIButton]! {
        didSet {
            segments.forEach { $0.isExclusiveTouch = true }
            setUnderlineConstraints()
        }
    }
    private let underline: UIView
    private var selectedIndex: Int
    private var underlinePositionConstraint: NSLayoutConstraint?
    
    weak var delegate: CustomSegmentedControlDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        underline = UIView()
        selectedIndex = 0
        super.init(coder: aDecoder)
        addSubview(underline)
    }
    
    @IBAction private func actionSegmentTouch(_ sender: UIButton) {
        let index = segments.index(of: sender)!
        guard index != selectedIndex else {
            return
        }
        underlinePositionConstraint?.isActive = false
        let newUnderlinePositionConstraint = NSLayoutConstraint(item: underline, attribute: .leading, relatedBy: .equal, toItem: sender, attribute: .leading, multiplier: 1, constant: 0)
        underlinePositionConstraint = newUnderlinePositionConstraint
        addConstraint(newUnderlinePositionConstraint)
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        selectedIndex = segments.index(of: sender)!
        delegate?.selectedSegmentDidChange()
    }
    
    private func setUnderlineConstraints() {
        underline.translatesAutoresizingMaskIntoConstraints = false
        underlinePositionConstraint = NSLayoutConstraint(item: underline, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: underline, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: underline, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1 / CGFloat(segments.count), constant: 0)
        let heightConstraint = NSLayoutConstraint(item: underline, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.1, constant: 0)
        addConstraints([underlinePositionConstraint!, bottomConstraint, widthConstraint, heightConstraint])
    }
    
}

extension CustomSegmentedControl {
    
    @IBInspectable var underlineColor: UIColor {
        get {
            return underline.backgroundColor!
        }
        set {
            underline.backgroundColor = newValue
        }
    }
    
    var selectedSegmentIndex: Int {
        get {
            return selectedIndex
        }
        set {
            guard segments.count > newValue && newValue != selectedIndex else {
                return
            }
            actionSegmentTouch(segments[newValue])
        }
    }
    
}

