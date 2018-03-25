import Foundation

protocol StartViewPresenter: class {
    func viewDidLoad()
}

final class StartPresenter {
    
    private weak var view: StartView?
    private let router: StartRouterProtocol
    
    init(view: StartView, router: StartRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}

extension StartPresenter: StartViewPresenter {
    
    func viewDidLoad() {
        let deadlineTime = DispatchTime.now() + .milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.router.presentLoginScreen(from: self.view!)
        }
    }
    
}
