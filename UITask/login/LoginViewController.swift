import UIKit
import TKSubmitTransition

protocol LoginView: class {
    func startFinishAnimation(delay: TimeInterval, completion: @escaping () -> Void)
}

final class LoginViewController: UIViewController {
    
    @IBOutlet private var segmentedControl: CustomSegmentedControl!
    @IBOutlet private var continueButton: TKTransitionSubmitButton!
    @IBOutlet private var containerView: UIView!
    
    var presenter: LoginViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "LoginInput" {
            if let vc = segue.destination as? LoginInputTableViewController {
                vc.delegate = self
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction private func actionContinue(_ sender: TKTransitionSubmitButton) {
        segmentedControl.isUserInteractionEnabled = false
        containerView.isUserInteractionEnabled = false
        sender.startLoadingAnimation()
        presenter.onContinueAction()
    }
    
}

extension LoginViewController: LoginView {
    
    func startFinishAnimation(delay: TimeInterval, completion: @escaping () -> Void) {
        continueButton.startFinishAnimation(delay) {
            self.segmentedControl.isUserInteractionEnabled = true
            self.containerView.isUserInteractionEnabled = true
            completion()
        }
    }
    
}

extension LoginViewController: LoginInputViewDelegate {
    
    func onLoginInputUpdate(username: String?, password: String?) {
        continueButton.isEnabled = username != nil && password != nil
    }
    
}

