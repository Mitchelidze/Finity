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
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logOutButton.isHidden = true
    }
    
    @IBAction func onLogOut(_ sender: Any) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            // Hide the Logout button and show the Login UI elements
            logOutButton.isHidden = true
//            showUIElements()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
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
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
                
                guard self != nil else {
                    return
                }
                
                guard error == nil else {
                    FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
                        
                        guard error == nil else {
                            print("signing up failed: \(error!.localizedDescription)")
                            return
                        }
                        
                        print("signed up")
                        self?.hideUIElements()
                        self?.logOutButton.isHidden = false
                    })
                    return
                }
                print("signed in")
                self?.hideUIElements()
                self?.logOutButton.isHidden = false
            })
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Required field", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func hideUIElements() {
        passwordTextField.isHidden = true
        emailTextField.isHidden = true
        titleLabelView.isHidden = true
        subTitleLabelView.isHidden = true
        signUpButton.isHidden = true
        alreadyHaveAnAccountLabelView.isHidden = true
        logInButton.isHidden = true

        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

}
