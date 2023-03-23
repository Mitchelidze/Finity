//
//  OnboardingViewController.swift
//  Finity
//
//  Created by michelidze'smacbook on 22.03.23.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var titleLabelView: UILabel!
    @IBOutlet weak var pageControlView: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: OnboardingDataSource?

    
    private var infoContentData = [
        AppPreviewTextContent(title: "Explore Upcoming and Nearby Events "),
        AppPreviewTextContent(title: "Web Have Modern Events Calendar Feature"),
        AppPreviewTextContent(title: "To Look Up More Events or Activities Nearby By Map")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("OnboardingViewController loaded")
        setupLayout()
        
        dataSource = OnboardingDataSource(collectionView: collectionView)
        dataSource?.scrollViewWillEndDragging = { [weak self] index in
            guard let self = self else { return }
            
            self.pageControlView.currentPage = index
            
            let infoContent = self.infoContentData[index]
            
            self.titleLabelView.text = infoContent.title
        }
    }
    
    private func setupLayout() {
        pageControlView.numberOfPages = infoContentData.count
    }
    
    @IBAction func onSkip(_ sender: Any) {
        print("skip tapped") //იპრინტება ანუ ფუნქციაში შემოდიs
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func onContinue(_ sender: Any) {
        guard pageControlView.currentPage + 1 < infoContentData.count else {
            return
        }
        
        let nextIndex = pageControlView.currentPage + 1
        let infoContent = infoContentData[nextIndex]
        
        titleLabelView.text = infoContent.title
        
        pageControlView.currentPage = nextIndex
        
        dataSource?.nextPage(index: nextIndex)
    }
}
