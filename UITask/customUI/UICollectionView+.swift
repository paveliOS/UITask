import UIKit

extension UICollectionView {
    
    func reloadData(animated: Bool) {
        if animated {
            let transition = CATransition()
            transition.type = kCATransitionFade
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.subtype = kCATransitionFromBottom
            layer.add(transition, forKey: nil)
        }
        reloadData()
    }
    
}
