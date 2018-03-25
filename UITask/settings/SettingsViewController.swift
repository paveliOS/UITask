import UIKit

protocol SettingsView: class {
}

final class SettingsViewController: UIViewController {
    
    @IBOutlet private var menuButton: UIButton!
    @IBOutlet private var logoutButton: UIButton!
    
    var presenter: SettingsViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let revealVC = revealViewController() {
            menuButton.addTarget(revealVC, action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }
    
}

extension SettingsViewController: SettingsView {
    
}


