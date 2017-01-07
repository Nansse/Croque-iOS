//
//  HomeWaiting.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 26/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class HomeWaiting: UIViewController {

    @IBOutlet weak var backButton: CRRectangleButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.colors = (dark: CRColor.darkGray, light: CRColor.lightGray)
        
    }

    @IBAction func backWasPressed() {
        Home.shared.presentInContainer(viewController: Home.shared.closedVC)
    }
    override func viewDidLayoutSubviews() {
        backButton.updateHeightConstraint()
    }
}
