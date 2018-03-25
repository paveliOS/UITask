import UIKit

protocol LoginRouterProtocol: class {
    func presentHomeScreen(from view: LoginView)
}

final class LoginRouter {
    
    private static let storyboardName = "Login"
    private static let vcID = "LoginViewController"
    
    
}

extension LoginRouter: LoginRouterProtocol {
    
    func presentHomeScreen(from view: LoginView) {
        let homeView = HomeRouter.setupHomeModule()
        if let navVC = (view as? UIViewController)?.navigationController {
            navVC.push(homeView, duration: 0.3)
        }
    }
    
}

extension LoginRouter {
    
    static func setupLoginModule() -> UIViewController {
        let router = LoginRouter()
        let view = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: vcID) as! LoginViewController
        let presenter = LoginPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
}
