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
    
    let bottomControlls = BottomControlls()
    let pages = [Page(image: #imageLiteral(resourceName: "image_4"), headerText: "Welcome to This New and Exciting App!", descriptionText: "This new service provides users with added value in their lives."),
                 Page(image: #imageLiteral(resourceName: "image_1"), headerText: "Spend More Time Finding Meaning in Your Life.", descriptionText: "We can take care of the annoying stuff you need to get done, so you can focus on what really matters."),
                 Page(image: #imageLiteral(resourceName: "image_2"), headerText: "Join an exclusive club of high functioning, happy people.", descriptionText: "People who spend more time doing getting the real sh*t done live happier lives, and spend their free time however they like."),
                 Page(image: #imageLiteral(resourceName: "image_3"), headerText: "Subcribe now, and get your first month absolutely free!", descriptionText: "From just £95 per week, you can feel free. Get your own personal assistant now.")]
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - ViewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
        animateFadeInViews()
    }
    
}
