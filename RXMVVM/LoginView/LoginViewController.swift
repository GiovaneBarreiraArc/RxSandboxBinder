//
//  ViewController.swift
//  RXMVVM
//
//  Created by Giovane Barreira on 29/06/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinders()
    }
    
    func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToHomePage()
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true)
    }

    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let email = emailField.text,
              let password = passwordField.text else {
            print ("Please enter email and password")
            return
        }
        
        viewModel.login(email: email, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

