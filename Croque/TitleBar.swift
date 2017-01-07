//
//  TitleBar.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 02/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class TitleBar: UIView {
    
    enum Style {
        case settings, back
    }
    
    var leftButton: UIButton?
    var leftButtonAction: () -> () = {}
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {

    }
    
    @objc private func leftButtonWasPressed() {
        leftButtonAction()
    }
    
    func setLeftButton(to button: Style, withTarget target: @escaping () -> ()) {
        switch button {
        case .back:
            leftButton = UIButton(frame: CGRect(x: 17, y: 30, width: 29, height: 20))
            leftButton!.setBackgroundImage(#imageLiteral(resourceName: "back"), for: .normal)
        default:
            leftButton = UIButton(frame: CGRect(x: 17, y: 26, width: 26, height: 26))
            leftButton!.setBackgroundImage(#imageLiteral(resourceName: "settings"), for: .normal)
        }
        leftButtonAction = target
        leftButton!.addTarget(self, action: #selector(TitleBar.leftButtonWasPressed), for: .touchUpInside)
        addSubview(leftButton!)
    }
}
