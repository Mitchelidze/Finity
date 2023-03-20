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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func onSignUp(_ sender: Any) {
        print("Sign up button tapped")
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("fields are empty")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            print("signed in")
            strongSelf.passwordTextField.isHidden = true
            strongSelf.emailTextField.isHidden = true
            strongSelf.titleLabelView.isHidden = true
            strongSelf.subTitleLabelView.isHidden = true
        })
    }
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Contionue", style: .default, handler: {_ in
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
            })
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            
        }))
        
        present(alert, animated: true)
    }
                        
}
