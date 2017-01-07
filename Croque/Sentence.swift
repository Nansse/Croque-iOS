//
//  Sentence.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 28/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit


struct Sentence: CustomStringConvertible {
    
    enum Sex: Int {
        case 👦 = 0, 👧
        
        init(determinant: String) {
            if determinant == "Un" {
                self = .👦
            } else {
                self = .👧
            }
        }
    }
    
    struct Word: CustomStringConvertible {
        let m: String
        let f: String
        
        var description: String {
            return m
        }
        
        init(m: String) {
            self.m = m
            self.f = m
        }
        init(m:String, f: String) {
            self.m = m
            self.f = f
        }
        
        func toString(sex: Sex) -> String {
            switch sex {
            case .👦:
                return m
            case .👧:
                return f
            }
        }
    }
    
    static var wordGroups: [[Word]] = [[Word(m: "Un"), Word(m: "Une")], [Word(m: "banal", f: "banale"),  Word(m: "cynique"), Word(m: "croquant", f: "croquante"), Word(m: "émouvant", f: "émouvante"), Word(m: "hardi", f: "hardie"), Word(m: "caractériel", f: "caractérielle"), Word(m: "infernal", f: "infernalle"), Word(m: "rocambolesque"), Word(m: "chouet", f: "chouette"), Word(m: "attachant", f: "attachante"), Word(m: "ambitieu", f: "ambitieuse"), Word(m: "gourmant", f: "gourmande")], [Word(m: "ingenieur", f: "ingenieure"),  Word(m: "cineaste"), Word(m: "artiste"), Word(m: "architecte"), Word(m: "geek"), Word(m: "entrepreneur", f: "entrepreneuse"), Word(m: "musicien", f: "musicienne"), Word(m: "politicien", f: "politicienne"), Word(m: "polyglot"), Word(m: "philantrope"), Word(m: "fou", f: "folle")], [Word(m: "du futur"),  Word(m: "du passé"), Word(m: "un peu perdu"), Word(m: "déterminé", f:"déterminée"), Word(m: "qui meurt de faim"), Word(m: "disjoncté", f:"disjonctée"), Word(m: "calineu", f: "calineuse"), Word(m: "proactif", f: "proactive"), Word(m: "polyglot"), Word(m: "philantrope"), Word(m: "fou", f: "folle")]]
    
    var sex: Sex
    
    private var stringArray = [String]()
    
    init(values: [Int]) {
        stringArray.append(Sentence.wordGroups[0][values[0]].m)
        sex = Sex(rawValue: values[0])!
        
        for i in 1..<values.count {
            stringArray.append(Sentence.wordGroups[i][values[i]].toString(sex: sex))
        }
        
    }
    
    init() {
        
        let randomIndex = Int(arc4random_uniform(UInt32(2)))
        stringArray.append(Sentence.wordGroups[0][randomIndex].m)
        sex = Sex(rawValue: randomIndex)!
        
        for i in 1..<Sentence.wordGroups.count {
            let randomIndex = Int(arc4random_uniform(UInt32(Sentence.wordGroups[i].count)))
            stringArray.append(Sentence.wordGroups[i][randomIndex].toString(sex: sex))
        }
    }
    
    var description: String {
        return stringArray.joined(separator: " ")
    }
    
    subscript(index: Int) -> String {
        return stringArray[index]
    }
    
}
