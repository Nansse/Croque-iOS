//
//  Lunch.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 26/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

struct Lunch {
    
    static var all = [Lunch]()
    
    enum TimeSlot: Int, CustomStringConvertible {
        case eleven = 11, twelve, thirteen
        
        var description: String {
            switch self {
            case .eleven:
                return "11h - 12h"
            case .twelve:
                return "12h - 13h"
            case .thirteen:
                return "13h - 14h"
            }
        }
    }
    
    var question: String
    var answers: [String]
    var date = Date()
    var timeSlot: TimeSlot?
    
    var answer: Int?
    
    // As the user is always a participant he is not in this liste
    var participants = [User]()
    
    init(question: String, answers: [String]) {
        self.question = question
        self.answers = answers
        self.participants.append(User())
        self.participants.append(User())
    }
    
    init(json: JSON) {
        question = json["body"].string!
        answers = [String]()
        
        for (_,answer):(String, JSON) in json["answers"] {
            answers.append(answer["body"].string!)
        }
    }
    
    
 
}
