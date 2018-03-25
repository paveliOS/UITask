import UIKit

class ExclusiveTouchButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isExclusiveTouch = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isExclusiveTouch = true
    }
    
}

