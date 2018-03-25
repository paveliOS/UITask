import UIKit

protocol HomeRouterProtocol: class {
    func presentSettingsScreen(from view: HomeView)
    func presentLoginScreen(from view: HomeView)
}

final class HomeRouter {
    
    private static let storyboardName = "Home"
    private static let vcID = "HomeViewController"
    private static let tabBarID = "CustomTabBarController"
    
}

extension HomeRouter: HomeRouterProtocol {
    
    func presentSettingsScreen(from view: HomeView) {
        let settingsView = SettingsRouter.setupSettingsModule()
        if let navVC = (view as? UIViewController)?.navigationController {
            navVC.popViewController(animated: false)
            navVC.push(settingsView, duration: 0.3)
        }
    }
    
    func presentLoginScreen(from view: HomeView) {
        if let navVC = (view as? UIViewController)?.navigationController {
            navVC.popViewController(animated: false)
        }
    }
    
}

extension HomeRouter {
    
    static func setupHomeModule() -> UIViewController {
        let router = HomeRouter()
        let tabBar = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: tabBarID) as! UITabBarController
        let homeView = tabBar.viewControllers!.first! as! HomeViewController
        let presenter = HomePresenter(view: homeView, router: router)
        homeView.presenter = presenter
        let menuView = MenuViewController.instantiate() as! MenuViewController
        menuView.delegate = presenter
        let revealVC = SWRevealViewController(rearViewController: menuView, frontViewController: tabBar)!
        return revealVC
    }
    
}
