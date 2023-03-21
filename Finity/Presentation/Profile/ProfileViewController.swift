//
//  ProfileViewController.swift
//  Finity
//
//  Created by michelidze'smacbook on 25.02.23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    @IBOutlet weak var titleLabelView: UILabel!
    @IBOutlet weak var subTitleLabelView: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var alreadyHaveAnAccountLabelView: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func onLogIn(_ sender: Any) {
        print("tapped log in button")
        titleLabelView.text = "Log in to Finity Account"
        subTitleLabelView.isHidden = true
        signUpButton.setTitle("Log in", for: .normal)
        alreadyHaveAnAccountLabelView.text = "Don't have an account?"
        logInButton.setTitle("Sign up", for: .normal)
        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        print("Sign up button tapped")
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            
            showAlert(message: "Please enter the email and password")
            return
        }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in

            guard let strongSelf = self else {
                return
            }

            guard error == nil else {
                print("signing up filed: \(error!.localizedDescription)")
                return
            }
            print("signed in")
            strongSelf.passwordTextField.isHidden = true
            strongSelf.emailTextField.isHidden = true
            strongSelf.titleLabelView.isHidden = true
            strongSelf.subTitleLabelView.isHidden = true
            strongSelf.signUpButton.isHidden = true
            strongSelf.alreadyHaveAnAccountLabelView.isHidden = true
            strongSelf.logInButton.isHidden = true


            strongSelf.emailTextField.resignFirstResponder()
            strongSelf.passwordTextField.resignFirstResponder()
        })
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Required field", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
                        
}
