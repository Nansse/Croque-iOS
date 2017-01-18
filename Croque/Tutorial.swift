//
//  Tutorial.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 01/12/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit
import Alamofire

class Tutorial: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        signup()
        
        // Do any additional setup after loading the view.
    }
    
    private func signup() {
        
        let parameters: Parameters = [
            "email": "gauthier@de-chezelles.com",
            "firstname": "Gauthier",
            "lastname": "de Chezelles",
            "password": "admin"
        ]
        Alamofire.request(serverURL + "/users", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: {response in
            let json = JSON(response.result.value)
            print(json)
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
