import UIKit

protocol StartRouterProtocol: class {
    func presentLoginScreen(from view: StartView)
}

final class StartRouter {
    
    private static let storyboardName = "Start"
    private static let vcID = "StartViewController"
    
    
}

extension StartRouter: StartRouterProtocol {
    
    func presentLoginScreen(from view: StartView) {
        let loginView = LoginRouter.setupLoginModule()
        if let navVC = (view as? UIViewController)?.navigationController {
            navVC.push(loginView, duration: 2, transitionType: kCATransitionReveal, transitionSubtype: kCATransitionFromRight)
        }
    }
    
}

extension StartRouter {
    
    static func setupStartModule() -> UIViewController {
        let router = StartRouter()
        let view = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: vcID) as! StartViewController
        let presenter = StartPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
}
