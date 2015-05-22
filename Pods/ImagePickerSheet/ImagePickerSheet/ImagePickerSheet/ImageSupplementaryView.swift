//
//  ImageSupplementaryView.swift
//  ImagePickerSheet
//
//  Created by Laurin Brandner on 06/09/14.
//  Copyright (c) 2014 Laurin Brandner. All rights reserved.
//

import UIKit

class ImageSupplementaryView : UICollectionReusableView {
    
    private let button: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.whiteColor()
        button.userInteractionEnabled = false
        button.setImage(ImageSupplementaryView.checkmarkImage, forState: .Normal)
        button.setImage(ImageSupplementaryView.selectedCheckmarkImage, forState: .Selected)
        
        return button
    }()
    
    var buttonInset = UIEdgeInsetsZero
    
    var selected: Bool = false {
        didSet {
            button.selected = selected
            button.backgroundColor = (selected) ? tintColor : nil
        }
    }
    
    class var checkmarkImage: UIImage? {
        let bundle = NSBundle(forClass: ImagePickerSheet.self)
        let image = UIImage(named: "ImagePickerSheet-checkmark", inBundle: bundle, compatibleWithTraitCollection: nil)
        
        return image?.imageWithRenderingMode(.AlwaysTemplate)
    }
    
    class var selectedCheckmarkImage: UIImage? {
        let bundle = NSBundle(forClass: ImagePickerSheet.self)
        let image = UIImage(named: "ImagePickerSheet-checkmark-selected", inBundle: bundle, compatibleWithTraitCollection: nil)
        
        return image?.imageWithRenderingMode(.AlwaysTemplate)
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    private func initialize() {
        addSubview(button)
    }
    
    // MARK: - Other Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        selected = false
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.sizeToFit()
        button.frame.origin = CGPointMake(buttonInset.left, CGRectGetHeight(bounds)-CGRectGetHeight(button.frame)-buttonInset.bottom)
        button.layer.cornerRadius = CGRectGetHeight(button.frame) / 2.0
    }
    
}
