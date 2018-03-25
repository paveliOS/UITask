import UIKit

protocol LoginInputViewDelegate: class {
    func onLoginInputUpdate(username: String?, password: String?)
}

final class LoginInputTableViewController: UITableViewController {
    
    @IBOutlet private var usernameField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    
    weak var delegate: LoginInputViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        usernameField.tintColor = .white
        passwordField.tintColor = .white
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 4
    }
    
    @IBAction private func onInputEditing(_ sender: UITextField) {
        delegate?.onLoginInputUpdate(username: usernameField.textValue, password: passwordField.textValue)
    }
    
}

extension LoginInputTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


