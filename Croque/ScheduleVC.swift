//
//  ScheduleVC.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 26/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController {
    
    @IBOutlet var buttons: [TimeSoltButton]!
    
    var selectedColor: Colors?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLeftBarItem()
        setupButtons()
        
        // Title of the navBar
        title = "DEJEUNER"
    }
    
    private func setupButtons() {
        
        let action = { [unowned self] in self.performSegue(withIdentifier: "showSumup", sender: nil) }
        
        buttons[0].setupWith(time: 11, color: CRColor.allRandoms[0], action: action)
        buttons[1].setupWith(time: 12, color: CRColor.allRandoms[1], action: action)
        buttons[2].setupWith(time: 13, color: CRColor.allRandoms[2], action: action)
        
        
    }
    
    // MARK:- Navigation
    
    @IBAction func slotWasSelected(button: TimeSoltButton) {
        (navigationController as? LunchNavigationController)?.lunch.timeSlot = Lunch.TimeSlot(rawValue: button.time)
        selectedColor = button.colors
        button.action()
    }
    
    /// Sets the left bar item with the back image
    private func setUpLeftBarItem() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 29, height: 20))
        button.addTarget(self, action: #selector(ScheduleVC.backWasPressed), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        let item = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = item
    }
    
    /// Goes back to questionVC
    @objc private func backWasPressed() {
        navigationController!.popViewController(animated: true)
    }
    
    /// Sends the selected color to the sumupVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSumup" {
            let controller = segue.destination as! SumupVC
            controller.mainColor = selectedColor!
        }
    }
    
    
}
