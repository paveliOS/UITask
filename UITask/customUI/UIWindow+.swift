import UIKit

extension UIWindow {
    
    func setRootViewController(_ vc: UIViewController, duration: CFTimeInterval, transitionType: String = kCATransitionFade, transitionSubtype: String = kCATransitionFade) {
        let transition = CATransition()
        transition.type = transitionType
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.subtype = transitionSubtype
        layer.add(transition, forKey: kCATransition)
        rootViewController = vc
    }
    
}
