import UIKit

extension UITextField {
    
    var textValue: String? {
        return text!.isEmpty ? nil : text
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        get {
            if let attrPlaceholder = attributedPlaceholder {
                return attrPlaceholder.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor
            } else {
                return nil
            }
        }
        set {
            if let placeholder = self.placeholder, let color = newValue {
                var attributes: [NSAttributedStringKey : Any] = [:]
                attributes[.foregroundColor] = color
                attributes[.font] = font
                attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
            }
        }
    }
    
}

