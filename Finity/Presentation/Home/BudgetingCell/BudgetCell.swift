//
//  BudgetCell.swift
//  Finity
//
//  Created by michelidze'smacbook on 23.03.23.
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
    }
}
