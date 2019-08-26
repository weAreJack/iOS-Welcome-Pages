//
//  SwipingCollectionsController.swift
//  autolayout_welcome_pages
//
//  Created by Jack Smith on 25/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class SwipingCollectionsController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    let pages = [PageModel(image: #imageLiteral(resourceName: "image_4"), headerText: "Welcome to This New and Exciting App!", descriptionText: "This new service provides users with added value in their lives."),
                 PageModel(image: #imageLiteral(resourceName: "image_1"), headerText: "Spend More Time Finding Meaning in Your Life.", descriptionText: "We can take care of the annoying stuff you need to get done, so you can focus on what really matters."),
                 PageModel(image: #imageLiteral(resourceName: "image_2"), headerText: "Join an exclusive club of high functioning, happy people.", descriptionText: "People who spend more time doing getting the real sh*t done live happier lives, and spend their free time however they like."),
                 PageModel(image: #imageLiteral(resourceName: "image_3"), headerText: "Subcribe now, and get your first month absolutely free!", descriptionText: "From just £95 per week, you can feel free. Get your own personal assistant now.")]
    
    let bottomControlls = BottomControlls()
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - ViewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
        animateFadeInViews()
    }
    
    // MARK: - ViewController
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.bottomControlls.pageControll.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        })
    }
    
    // MARK: - ScrollView
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        bottomControlls.pageControll.currentPage = Int(x / view.frame.width)
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(bottomControlls)
        let layoutGuide = view.safeAreaLayoutGuide
        bottomControlls.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        bottomControlls.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomControlls.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 16).isActive = true
        bottomControlls.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -16).isActive = true
        
        bottomControlls.nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        bottomControlls.previousButton.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        bottomControlls.pageControll.numberOfPages = pages.count
        
    }
    
    @objc fileprivate func handleNext() {
        let nextPage = min(bottomControlls.pageControll.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextPage, section: 0)
        bottomControlls.pageControll.currentPage = nextPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc fileprivate func handlePrevious() {
        let prevPage = max(bottomControlls.pageControll.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevPage, section: 0)
        bottomControlls.pageControll.currentPage = prevPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}
