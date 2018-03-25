protocol SettingsViewPresenter: class {
    
}

final class SettingsPresenter {
    
    private weak var view: SettingsView?
    private let router: SettingsRouterProtocol
    
    init(view: SettingsView, router: SettingsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}

extension SettingsPresenter: SettingsViewPresenter {
    
}

extension SettingsPresenter: MenuDelegate {
    
    func onHomeAction() {
        let deadlineTime = DispatchTime.now() + .milliseconds(250)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.router.presentHomeScreen(from: self.view!)
        }
    }
    
    func onSettingsAction() {
        
    }
    
    func onLogoutAction() {
        let deadlineTime = DispatchTime.now() + .milliseconds(250)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.router.presentLoginScreen(from: self.view!)
        }
    }
    
}

