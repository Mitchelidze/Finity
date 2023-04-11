//
//  BudgetingCell.swift
//  Finity
//
//  Created by michelidze'smacbook on 05.03.23.
//

import UIKit

class BudgetingCell: UITableViewCell {
    
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
    
    var isAddAssetsButtonHidden = true {
        didSet {
            assetsAddButton.isHidden = isAddAssetsButtonHidden
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        
        isBalanceLabelHidden = true
        isSavingsLabelHidden = true
        isAssetsLabelHidden = true
        
        
        cardView.layer.cornerRadius = 14
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived(_:)), name: Notification.Name("Asset"), object: nil)
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func notificationReceived(_ notification: NSNotification) {
        isAssetsLabelHidden = false
        isAddAssetsButtonHidden = true
        
        if let text = notification.userInfo?["AmountText"] as? String {
            assetsLabelView.text = text
        }
    }
    
    @IBAction func onAddCashBalance(_ sender: Any) {
        guard let viewController = self.window?.rootViewController else {
            return
        }
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        guard let addAssetsViewController = storyboard.instantiateViewController(withIdentifier: "AddAssetsViewController") as? AddAssetsViewController else {
            return
        }
        
        viewController.present(addAssetsViewController, animated: true, completion: nil)

    }
    
    @IBAction func onAddSavings(_ sender: Any) {
        guard let viewController = self.window?.rootViewController else {
            return
        }
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        guard let addAssetsViewController = storyboard.instantiateViewController(withIdentifier: "AddAssetsViewController") as? AddAssetsViewController else {
            return
        }
        
        viewController.present(addAssetsViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func onAddAssets(_ sender: Any) {
        guard let viewController = self.window?.rootViewController else {
            return
        }
        
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        guard let addAssetsViewController = storyboard.instantiateViewController(withIdentifier: "AddAssetsViewController") as? AddAssetsViewController else {
            return
        }
        
        viewController.present(addAssetsViewController, animated: true, completion: nil)
    }
    
}
