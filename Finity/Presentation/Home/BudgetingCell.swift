//
//  BudgetingCell.swift
//  Finity
//
//  Created by michelidze'smacbook on 05.03.23.
//

import UIKit

class BudgetingCell: UITableViewCell, AddAssetsDelegate {
    
    @IBOutlet weak var assetsAddButton: UIButton!
    @IBOutlet weak var balanceLabelView: UILabel!
    @IBOutlet weak var savingsLabelView: UILabel!
    @IBOutlet weak var assetsLabelView: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    var identifier = "BudgetingCell"
    let addAssetsViewController = AddAssetsViewController()
    var isBalanceLabelHidden = true {
        didSet {
            balanceLabelView.isHidden = isBalanceLabelHidden
        }
    }
    var isSavingsLabelHidden = true {
        didSet {
            savingsLabelView.isHidden = isSavingsLabelHidden
        }
    }
    var isAssetsLabelHidden = true {
        didSet {
            assetsLabelView.isHidden = isAssetsLabelHidden
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        addAssetsViewController.delegate = self
        isBalanceLabelHidden = true
        isSavingsLabelHidden = true
        isAssetsLabelHidden = true
        
        cardView.layer.cornerRadius = 14
        
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
        
        viewController.present(addAssetsViewController, animated: true, completion: nil)
    }
    
    func setAmountText(text: String) {
       assetsLabelView.text = text
        assetsLabelView.isHidden = false
    }
    
}
