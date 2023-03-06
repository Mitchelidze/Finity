//
//  AddAssetsViewController.swift
//  Finity
//
//  Created by michelidze'smacbook on 06.03.23.
//

import UIKit

class AddAssetsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onAddButton(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(message: "Please enter the name of asset")
            return
        }
        
        guard let amountString = amountTextField.text, !amountString.isEmpty else {
            showAlert(message: "Please enter the value price of the asset")
            return
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Required field", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}
