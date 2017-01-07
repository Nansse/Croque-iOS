//
//  DateCell.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 13/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
    @IBOutlet var date: UILabel!
    @IBOutlet var questionAnswerLabel: UILabel!
    
    private let questionColor = CRColor.darkGray
    private let answerColor = UIColor(hex: 0xACACAC) // Same color as the main word in a contact
    
    func setup(lunch: Lunch) {
        
        // Date
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE d MMMM"
        self.date.text = formatter.string(from: lunch.date).uppercased()
        self.date.addTextSpacing(spacing: 2)
        
        // Question & Answer
        let questionAnswer = NSMutableAttributedString(string: lunch.question + " " + lunch.answers[lunch.answer!], attributes: [NSFontAttributeName:UIFont(name: "Edmondsans-Regular", size: 17)!])
        
        questionAnswer.addAttribute(NSForegroundColorAttributeName, value: questionColor, range: NSRange(location: 0,length: lunch.question.characters.count))
        questionAnswer.addAttribute(NSForegroundColorAttributeName, value: answerColor, range: NSRange(location: lunch.question.characters.count + 1,length: lunch.answers[lunch.answer!].characters.count))
        questionAnswer.addTextSpacing(spacing: 2)
        
        questionAnswerLabel.attributedText = questionAnswer
        questionAnswerLabel.sizeToFit()
        
    }
}
