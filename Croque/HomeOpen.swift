//
//  HomeOpen.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 27/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class HomeOpen: UIViewController {
    
    @IBOutlet weak var lunch: CRRectangleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lunch.colors = (dark: CRColor.darkRed, light: CRColor.lightRed)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
