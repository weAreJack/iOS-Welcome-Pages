//
//  SwipingCollectionsController+Animations.swift
//  autolayout_welcome_pages
//
//  Created by Jack Smith on 26/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

extension SwipingCollectionsController {

    func animateFadeInViews() {
        
        let page = self.bottomControlls.pageControll.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        guard let cell = self.collectionView.cellForItem(at: indexPath) as? PageCell else {return}
        cell.imageView.alpha = 0
        cell.descriptionTextView.alpha = 0
        
        UIView.animateKeyframes(withDuration: 2, delay: 0.5, animations: {
            
            // Reveal Image
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                cell.imageView.alpha = 1
            })
            
            // Reveal Description
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                cell.descriptionTextView.alpha = 1
            })
            
        })
        
    }
    
    
}
