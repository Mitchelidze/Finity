//
//  BudgetCell.swift
//  Finity
//
//  Created by michelidze'smacbook on 12.04.23.
//

import UIKit

class BudgetCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabelView: UILabel!
    
    var identifier = "BudgetCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 14
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onTryForFree(_ sender: Any) {
        guard let viewController = self.window?.rootViewController else {
            return
        }
        
        let storyboard = UIStoryboard(name: "SalaryViewController", bundle: nil)
        guard let salaryViewController = storyboard.instantiateViewController(withIdentifier: "SalaryViewController") as? SalaryViewController else {
            return
        }
        
        viewController.present(salaryViewController, animated: true, completion: nil)
    }
    
}
