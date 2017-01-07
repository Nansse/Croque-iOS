//
//  Popup.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 06/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class Popup: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private var returnButton: UIButton!
    @IBOutlet private var card: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var mainColor: UIColor!
    
    init(title: String, message: String, color: UIColor? = CRColor.randomColors.dark) {
        super.init(frame: UIScreen.main.bounds)
        
        mainColor = color
        
        // Popup xib
        Bundle.main.loadNibNamed("Popup", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(contentView)
        
        titleLabel.text = title
        messageLabel.text = message
        
        card.layer.cornerRadius = 7
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func returnWasPressed() {
        self.removeFromSuperview()
    }
    
    static var toLate = Popup(title: "Désolé", message: "Cette horraire de repas est terminé")
}
