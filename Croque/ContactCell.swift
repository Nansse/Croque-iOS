//
//  ContactCell.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 12/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sentenceLabel: UILabel!
    @IBOutlet weak var cardView: CardView!
    
    var user: User!
    
    func setup(user: User, color: Colors) {
        
        // Color
        cardView.colors = color
        nameLabel.textColor = color.dark
        
        // Name
        nameLabel.text = user.concatenatedName
        nameLabel.addTextSpacing(spacing: 1.5)
        
        // Sentence
        
        let sentenceColor = CRColor.darkGray
        let mainWordColor = UIColor(hex: 0xACACAC)
        
        let sentence = NSMutableAttributedString(string: user.concatenatedSentence, attributes: [NSFontAttributeName:UIFont(name: "Edmondsans-Regular", size: 17)!])
        
        sentence.addAttribute(NSForegroundColorAttributeName, value: sentenceColor, range: NSRange(location: 0,length: user.concatenatedSentence.characters.count))
        sentence.addAttribute(NSForegroundColorAttributeName, value: mainWordColor, range: NSRange(location: user.sentence[0].characters.count + 1,length: user.sentence[1].characters.count))
        
        sentenceLabel.attributedText = sentence
        sentenceLabel.sizeToFit()
    }


}


class MainContactCell: ContactCell {
    
    override func setup(user: User, color: Colors) {
        super.setup(user: user, color: color)
        cardView.fillView.backgroundColor = color.light
        
        
    }
}
