import UIKit

protocol StartView: class {
    
}

final class StartViewController: UIViewController {
    
    var presenter: StartViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension StartViewController: StartView {
        
}
