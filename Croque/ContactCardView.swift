//
//  ContactCardView.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 27/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class ContactCardView: CardView {
    
    var nameLabel: UILabel!
    var sentenceLabel: UILabel!
    
    func setupWith(user: User) {
        
        // Name label
        nameLabel = UILabel(frame: CGRect(x: 20, y: 14, width: frame.width - 40, height: 21))
        nameLabel.font = UIFont(name: "Edmondsans-Medium", size: 20)
        nameLabel.textColor = colors.dark
        nameLabel.text = user.concatenatedName
        addSubview(nameLabel)
        
        
        
        // Sentence label
        sentenceLabel = UILabel(frame: CGRect(x: 20, y: 40, width: frame.width - 40, height: 46))
        
        let sentenceColor = CRColor.darkGray
        let mainWordColor = UIColor(hex: 0xACACAC)
        
        let sentence = NSMutableAttributedString(string: user.concatenatedSentence, attributes: [NSFontAttributeName:UIFont(name: "Edmondsans-Regular", size: 17)!])
        
        sentence.addAttribute(NSForegroundColorAttributeName, value: sentenceColor, range: NSRange(location: 0,length: user.concatenatedSentence.characters.count))
        sentence.addAttribute(NSForegroundColorAttributeName, value: mainWordColor, range: NSRange(location: user.sentence[0].characters.count + 1,length: user.sentence[1].characters.count))
        
        sentenceLabel.attributedText = sentence
        sentenceLabel.lineBreakMode = .byWordWrapping
        sentenceLabel.numberOfLines = 0
        sentenceLabel.sizeToFit()
        addSubview(sentenceLabel)
        
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: sentenceLabel.frame.height + nameLabel.frame.height + 30)
    }
    
    override func changeColor() {
        super.changeColor()
            nameLabel.textColor = colors.dark
    }
}
