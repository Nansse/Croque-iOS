//
//  HomeOpen.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 27/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class HomeOpen: UIViewController {
    
    @IBOutlet weak var lunchButton: CRRectangleButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lunchButton.colors = (dark: CRColor.darkRed, light: CRColor.lightRed)
        questionLabel.text = Home.shared.lunch.question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// Sends the lunch color to the navigationController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLunch" {
            let controller = segue.destination as! LunchNavigationController
            controller.lunch = Home.shared.lunch
        }
    }


}
