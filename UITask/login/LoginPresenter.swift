protocol LoginViewPresenter: class {
    func onContinueAction()
}

final class LoginPresenter {
    
    private weak var view: LoginView?
    private let router: LoginRouterProtocol
    
    init(view: LoginView, router: LoginRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}

extension LoginPresenter: LoginViewPresenter {
    
    func onContinueAction() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.view?.startFinishAnimation(delay: 0.4) {
                self.router.presentHomeScreen(from: self.view!)
            }
        }
        
    }
    
}

