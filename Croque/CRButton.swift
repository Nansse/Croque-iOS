//
//  CustomButton.swift
//  Croque
//
//  Created by Jean-Baptiste BEAU on 11/09/2016.
//  Copyright © 2016 Sublime. All rights reserved.
//

import UIKit

class CRButton: UIButton {
    
    var fillView: UIView!
    var colors: Colors! {
        didSet {
            changeColor()
        }
    }
    
    init(title: String, frame: CGRect) {
        super.init(frame: frame)
        self.setTitle(title, for: .normal)
        
        setup()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fillView.frame = CGRect(x: 5, y: 5, width: frame.width, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup() {
        backgroundColor = UIColor.clear
        
        
        // Title
        setTitle(titleLabel?.text?.uppercased(), for: .normal)
        titleLabel?.font = UIFont(name: "Edmondsans-Medium", size: 18)
        titleLabel?.addTextSpacing(spacing: 2)
        contentVerticalAlignment = .center
        
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.textAlignment = .center
        
        // Border
        layer.borderWidth = 2
        layer.cornerRadius = 7
        
        // Fill
        fillView = UIView()
        fillView.layer.cornerRadius = 7
        fillView.isUserInteractionEnabled = false
        insertSubview(fillView, at: 0)
        
        colors = CRColor.randomColors
    }
    
    func changeColor() {
        self.setTitleColor(colors.dark, for: .normal)
        layer.borderColor = colors.dark.cgColor
        fillView.backgroundColor = colors.light
    }
    
}
