//
//  LunchNavigationController.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 15/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class LunchNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    var lunch: Lunch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBorderColor(to: UIColor(hex: 0xE2E2E2))
        setupTitle()
        
        let answers = ["Mon pére est un pharmacien", "Pourquoi pas", "Je ne te crois pas avec tes histoires", "Si je dis oui et que tu dis non on ne sera pas ensemble", "En effet mon frére", "C'est vraiment trop stylé", "ou pas", "Dis Maman ?"]
        
        lunch = Lunch(question: "Quel superpouvoir voudrais-tu le plus avoir ?", answers: answers)
        
        
        // Activate gesture frome left to right to go back
        interactivePopGestureRecognizer?.delegate = self;
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    /// Changes the border color of the navigation bar
    private func setBorderColor(to color: UIColor) {
        UINavigationBar.appearance().shadowImage = color.as1ptImage()
        UINavigationBar.appearance().setBackgroundImage(UIColor.white.as1ptImage(), for: .default)
    }
    
    /// Changes the color of the title
    private func setupTitle() {
        UINavigationBar.appearance().barTintColor = CRColor.darkRed
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: CRColor.darkRed]
    }
    
}
