import UIKit

final class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.items!.forEach {
            $0.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
        tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        setAddButton()
    }
    
    private func setAddButton() {
        let addButton = ExclusiveTouchButton(type: .custom)
        let addImage = UIImage(named: "add")
        addButton.setImage(addImage, for: .normal)
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        let centerXConstraint = NSLayoutConstraint(item: addButton, attribute: .centerX, relatedBy: .equal, toItem: tabBar, attribute: .centerX, multiplier: 1, constant: 0)
        let originYConstraint = NSLayoutConstraint(item: addButton, attribute: .top, relatedBy: .equal, toItem: tabBar, attribute: .top, multiplier: 1, constant: 6)
        let aspectRatioConstraint = NSLayoutConstraint(item: addButton, attribute: .width, relatedBy: .equal, toItem: addButton, attribute: .height, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: addButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 37)
        addButton.addConstraint(aspectRatioConstraint)
        view.addConstraints([centerXConstraint, originYConstraint, heightConstraint])
    }
    
}

