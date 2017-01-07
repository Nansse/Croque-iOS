//
//  QuestionVC.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 26/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLeftBarItem()
    }
    
    override func viewDidLayoutSubviews() {
        if let lunch = (navigationController as? LunchNavigationController)?.lunch {
            questionLabel.text = lunch.question
            _ = answersTobuttons(answers: lunch.answers)
            
        }
        
    }
    
    
    
    /// Transforms the questions into buttons and adds them to the scrollView
    private func answersTobuttons(answers: [String]) -> [UIButton] {
        
        var buttons = [UIButton]()
        
        let width = scrollView.frame.width - 60
        
        for i in 0..<answers.count {
            let oldPosition = i != 0 ? buttons[i-1].frame.origin.y + buttons[i-1].frame.height : 0
            
            let newButton = CRRectangleButton(title: answers[i], frame: CGRect(x: 32, y: oldPosition + 20, width: width, height: 40))
            newButton.addTarget(self, action: #selector(self.buttonWasPressed(button:)), for: .touchUpInside)
            newButton.tag = i
            newButton.colors = CRColor.allRandoms[i]
            buttons.append(newButton)
            scrollView.addSubview(newButton)
        }
        
        scrollView.contentSize = CGSize(width: 0, height: buttons.reduce(0) {$0 + $1.frame.height + 22})
        
        return buttons
        
    }
    
    // MARK:- Navigation
    
    /// Sets the left bar item with the back image
    private func setUpLeftBarItem() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 29, height: 20))
        button.addTarget(self, action: #selector(QuestionVC.backWasPressed), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        let item = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = item
    }
    
    /// Dismissis the navigation view controller
    @objc private func backWasPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    /// Shows the scheduleVC
    @objc private func buttonWasPressed(button: UIButton) {
        
        (navigationController as? LunchNavigationController)?.lunch.answer = button.tag
        
        performSegue(withIdentifier: "showShedule", sender: nil)
    }
}
