import UIKit

protocol MenuDelegate: class {
    func onHomeAction()
    func onSettingsAction()
    func onLogoutAction()
}

final class MenuViewController: UIViewController {
    
    private static let storyboardName = "Menu"
    private static let vcID = "MenuViewController"
    
    @IBOutlet private var buttonsOriginConstraint: NSLayoutConstraint!
    @IBOutlet private var buttonsWidthConstraint: NSLayoutConstraint!
    
    weak var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let revealVC = revealViewController() {
            buttonsWidthConstraint.constant = revealVC.rearViewRevealWidth - 2 * buttonsOriginConstraint.constant
        }
    }
    
    @IBAction private func actionHome(_ sender: UIButton) {
        revealViewController()?.revealToggle(animated: true)
        delegate?.onHomeAction()
    }
    
    @IBAction private func actionSettings(_ sender: UIButton) {
        revealViewController()?.revealToggle(animated: true)
        delegate?.onSettingsAction()
    }
    
    @IBAction private func actionLogout(_ sender: UIButton) {
        revealViewController()?.revealToggle(animated: true)
        delegate?.onLogoutAction()
    }
    
}

extension MenuViewController {
    
    static func instantiate() -> UIViewController {
        let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: vcID)
        return vc
    }
    
}

