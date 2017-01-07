
//
//  CRRectangleButton.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 26/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class CRRectangleButton: CRButton {
    
    override func setup() {
        super.setup()
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        // When the view's frame is not defined by its constraints 
        setSize()
    }
    
    
    /// Sets the height of the button depending on the number of lines
    internal func setSize() {
        let height = titleLabel!.text!.heightWithConstrainedWidth(width: frame.width - 100, font: UIFont(name: "Edmondsans-Medium", size: 18)!) + 20
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: height)
    }
    
    
    func updateHeightConstraint() {
        let height = titleLabel!.text!.heightWithConstrainedWidth(width: frame.width - 60, font: UIFont(name: "Edmondsans-Medium", size: 18)!) + 20
        for constraint in constraints {
            if constraint.firstAttribute == NSLayoutAttribute.height {
                print("changing constant")
                print(constraint.constant)
                constraint.constant = height
                print(constraint.constant)
            }
        }

    }
}


class CRCircularButton: CRButton {
    
    override func setup() {
        super.setup()
        
        // Rectangle -> Circular
        let viewDiameter = CGFloat(120)
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: viewDiameter, height: viewDiameter)
        layer.cornerRadius = frame.width/2
        fillView.layer.cornerRadius = frame.width/2
        
    }
    
}

class TimeSoltButton: CRCircularButton {
    
    var time: Int!
    private let disabeldColors = (dark: CRColor.darkGray, light: CRColor.lightGray)
    
    
    func setupWith(time: Int, color: Colors, action: @escaping ()->()) {
        super.setup()
        
        self.time = time
        self.action = action
        
        let hour = Calendar.current.component(.hour, from: Date())
        if hour > time {
            self.colors =  disabeldColors
            //self.action = showPopup
        }
        else { self.colors = color }
    }
    
    var action: (() -> ())!
    
    private var showPopup: () -> () = {
        // Add the popup over everything even navigation bar
        let window = UIApplication.shared.keyWindow!
        window.addSubview(Popup.toLate)
    }
    
}
