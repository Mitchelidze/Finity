//
//  OnboardingDataSource.swift
//  Finity
//
//  Created by michelidze'smacbook on 22.03.23.
//

import UIKit

class OnboardingDataSource: NSObject, UICollectionViewDataSource {
    private let collectionView: UICollectionView
    
    private var currentPage = 0
    
    var scrollViewWillEndDragging: ((Int) -> Void)?
    
    private let illustrations = [
        AppPreviewImage(imageName: "placeholder-image"),
        AppPreviewImage(imageName: "placeholder-image"),
        AppPreviewImage(imageName: "placeholder-image")
    ]
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "OnboardingImageCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingImageCell")
    }
    
    func nextPage(index: Int) {
        let rect = collectionView.layoutAttributesForItem(at: IndexPath(row: index, section: 0))?.frame
        collectionView.scrollRectToVisible(rect!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        illustrations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingImageCell", for: indexPath) as! OnboardingImageCell
        cell.configure(with: UIImage(named: illustrations[indexPath.row].imageName))
        return cell
    }
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let pageWidth = scrollView.frame.width
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        var newPage = Float(currentPage)
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? currentPage + 1 : currentPage - 1)
            if newPage < 0 {
                newPage = 0
            }
        }
        currentPage = Int(newPage)
        scrollViewWillEndDragging?(currentPage)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OnboardingDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        print(CGSize(width: collectionView.frame.width, height: collectionView.frame.height))
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }
}
