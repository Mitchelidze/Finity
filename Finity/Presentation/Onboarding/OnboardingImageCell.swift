//
//  OnboardingImageCell.swift
//  Finity
//
//  Created by michelidze'smacbook on 22.03.23.
//

import UIKit

class OnboardingImageCell: UICollectionViewCell {

    @IBOutlet weak var onboardingImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: UIImage?) {
        onboardingImageView.image = item
    }

}
