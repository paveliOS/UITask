import UIKit

protocol SettingsRouterProtocol: class {
    func presentHomeScreen(from view: SettingsView)
    func presentLoginScreen(from view: SettingsView)
}

final class SettingsRouter {
    
    private static let storyboardName = "Settings"
    private static let vcID = "SettingsViewController"
    
}

extension SettingsRouter: SettingsRouterProtocol {
    
    func presentHomeScreen(from view: SettingsView) {
        let homeView = HomeRouter.setupHomeModule()
        if let navVC = (view as? UIViewController)?.navigationController {
            navVC.popViewController(animated: false)
            navVC.push(homeView, duration: 0.3)
        }
    }
    
    func presentLoginScreen(from view: SettingsView) {
        if let navVC = (view as? UIViewController)?.navigationController {
            navVC.popViewController(animated: false)
        }
    }
    
    
}

extension SettingsRouter {
    
    static func setupSettingsModule() -> UIViewController {
        let router = SettingsRouter()
        let settingsView = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: vcID) as! SettingsViewController
        let presenter = SettingsPresenter(view: settingsView, router: router)
        settingsView.presenter = presenter
        let menuView = MenuViewController.instantiate() as! MenuViewController
        menuView.delegate = presenter
        let revealVC = SWRevealViewController(rearViewController: menuView, frontViewController: settingsView)!
        return revealVC
    }
    
}
