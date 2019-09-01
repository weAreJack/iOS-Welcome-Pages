 //
//  PageCell.swift
//  autolayout_welcome_pages
//
//  Created by Jack Smith on 25/08/2019.
//  Copyright © 2019 jack-adam-smith. All rights reserved.
//

import UIKit
 
 class PageCell : UICollectionViewCell {
    
    // MARK: - Properties
    
    var page : Page? {
        didSet {
            guard let page = page else {return}
            
            imageView.image = page.image
            imageView.tintColor = page.imageColour
            
            let attributedText = NSMutableAttributedString(string: page.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(page.descriptionText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
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
        backgroundColor = .white
        let imageContainerView = UIView()
        
        addSubview(imageContainerView)
        addSubview(descriptionTextView)
        
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        imageContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        imageContainerView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageContainerView.widthAnchor, multiplier: 0.6).isActive = true
        
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 16).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
    }
    
 }
