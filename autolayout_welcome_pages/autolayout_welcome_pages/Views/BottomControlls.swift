//
//  BottomControlls.swift
//  autolayout_welcome_pages
//
//  Created by Jack Smith on 25/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit

class BottomControlls : UIView {
    
    // MARK: - Properties
    
    let previousButton = setupButton(titleText: "Prev")
    let nextButton = setupButton(titleText: "Next")
    
    let pageControll : UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.currentPage = 0
        pageControll.currentPageIndicatorTintColor = .darkGray
        pageControll.pageIndicatorTintColor = .lightGray
        return pageControll
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    fileprivate func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [previousButton, pageControll, nextButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    static func setupButton(titleText: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(titleText, for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }
    
}
