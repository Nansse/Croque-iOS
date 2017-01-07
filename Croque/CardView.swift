//
//  CardView.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 13/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class CardView: UIView {

    // Random color for the card
    var colors = CRColor.randomColors {
        didSet {
            changeColor()
        }
    }
    var fillView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// Called when the view is initialised, sets the background and the borders of the card
    func setup() {
        
        backgroundColor = UIColor.clear
        
        // Border
        layer.borderColor = colors.dark.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 7
        
        // Fill
        fillView = UIView()
        fillView.backgroundColor = UIColor.white
        fillView.layer.cornerRadius = 7
        fillView.isUserInteractionEnabled = false
        insertSubview(fillView, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fillView.frame = CGRect(x: 5, y: 5, width: frame.width, height: frame.height)
    }
    
    internal func changeColor() {
        layer.borderColor = colors.dark.cgColor
    }
}
