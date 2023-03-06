//
//  BudgetingCell.swift
//  Finity
//
//  Created by michelidze'smacbook on 05.03.23.
//

import UIKit

class BudgetingCell: UITableViewCell {
    
    var identifier = "BudgetingCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onAddButton(_ sender: Any) {
        guard let viewController = self.window?.rootViewController else {
            return
        }
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        guard let addAssetsViewController = storyboard.instantiateViewController(withIdentifier: "AddAssetsViewController") as? AddAssetsViewController else {
            return
        }
        
//        addAssetsViewController.modalPresentationStyle = .overFullScreen
        viewController.present(addAssetsViewController, animated: true, completion: nil)
    }
}
