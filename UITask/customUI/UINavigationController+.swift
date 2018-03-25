import UIKit

extension UINavigationController {
    
    func push(_ vc: UIViewController, duration: CFTimeInterval, transitionType: String = kCATransitionFade, transitionSubtype: String = kCATransitionFade) {
        let transition = CATransition()
        transition.type = transitionType
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.subtype = transitionSubtype
        view.layer.add(transition, forKey: kCATransition)
        pushViewController(vc, animated: false)
    }
    
    func pop(duration: CFTimeInterval, transitionType: String = kCATransitionFade, transitionSubtype: String = kCATransitionFade) {
        let transition = CATransition()
        transition.type = transitionType
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.subtype = transitionSubtype
        view.layer.add(transition, forKey: kCATransition)
        popViewController(animated: false)
    }
    
}
