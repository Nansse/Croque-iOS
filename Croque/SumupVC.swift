//
//  ScheduleVC.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 26/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class SumupVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLeftBarItem()
        
        // Title of the navBar
        title = "DEJEUNER"
        
        setupSumup()
    }
    
    var mainColor: Colors!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var timeSlotLabel: UILabel!
    @IBOutlet weak var validButton: CRRectangleButton!
    
    private func setupSumup() {
        if let lunch = (navigationController as? LunchNavigationController)?.lunch {
            questionLabel.text = lunch.question
            answerLabel.text = lunch.answers[lunch.answer!]
            //answerLabel.sizeToFit()
            
            switch lunch.timeSlot! {
            case .eleven:
                timeSlotLabel.text = "11h - 12h"
            case .twelve:
                timeSlotLabel.text = "12h - 13h"
            case .thirteen:
                timeSlotLabel.text = "13h - 14h"
            }
        }
        
        // Colors
        answerLabel.textColor = mainColor.dark
        timeSlotLabel.textColor = mainColor.dark
        validButton.colors = mainColor
        
    }
    
    
    // MARK:- Navigation
    
    /// Sets the left bar item with the back image
    private func setUpLeftBarItem() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 29, height: 20))
        button.addTarget(self, action: #selector(self.backWasPressed), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        let item = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = item
    }
    
    /// Goes back to scheduleVC
    @objc private func backWasPressed() {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func validateWasPressed(_ sender: AnyObject) {
        print(navigationController!.parent)
        if let home = presentingViewController as? Home {
            print("Hey")
            home.presentInContainer(viewController: home.waitingVC)
        }
        navigationController?.dismiss(animated: true, completion: {})
    }
}
