//
//  SwipingCollectionsController+Animations.swift
//  autolayout_welcome_pages
//
//  Created by Jack Smith on 26/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension SwipingCollectionsController {
    
    func setupUI() {
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
    
    @objc func handleNext() {
        let nextPage = min(bottomControlls.pageControll.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextPage, section: 0)
        bottomControlls.pageControll.currentPage = nextPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handlePrevious() {
        let prevPage = max(bottomControlls.pageControll.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevPage, section: 0)
        bottomControlls.pageControll.currentPage = prevPage
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    func animateFadeInViews() {
        let page = self.bottomControlls.pageControll.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        guard let cell = self.collectionView.cellForItem(at: indexPath) as? PageCell else {return}
        cell.imageView.alpha = 0
        cell.descriptionTextView.alpha = 0
        
        UIView.animateKeyframes(withDuration: 2, delay: 0.5, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                cell.imageView.alpha = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                cell.descriptionTextView.alpha = 1
            })
        })
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.bottomControlls.pageControll.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        })
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        bottomControlls.pageControll.currentPage = Int(x / view.frame.width)
    }
    
}
