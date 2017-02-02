//
//  User.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 06/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import Foundation

class User {
    var id: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    var sentence: Sentence
    var lunches: [Lunch] {
        return Lunch.all.filter{$0.participants.filter{$0 == self}.count == 0}
    }
    
    var concatenatedName: String {
        return firstName + " " + lastName
    }
    
    var concatenatedSentence: String {
        return sentence.description
    }
    
    required init() {
        firstName = "Alain"
        lastName = "Turing"
        sentence = Sentence()
        id = 2
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.sentence = Sentence()
    }
    
    static var me = User(firstName: "Gauthier", lastName: "de Chezelles")
}

func == (lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
}
