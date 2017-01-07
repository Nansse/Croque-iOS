//
//  HistoryVC.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 06/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleBar: TitleBar!
    
    var data = [Any]()
    private var colors = [Colors]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleBar.setLeftButton(to: .back, withTarget: { [unowned self] in
            /*
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                
                let transition: CATransition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.type = kCATransitionReveal
                transition.subtype = kCATransitionFromRight
                self.view.window!.layer.add(transition, forKey: nil)
                self.dismiss(animated: false, completion: nil)
   
            })
            */
            
            self.dismiss(animated: true, completion: nil)
        })

        data = lunchesToData(lunches: Lunch.all)
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    private func lunchesToData(lunches: [Lunch]) -> [Any] {
        
        var data = [Any]()
        data.append(User.me)
        for lunch in lunches {
            data.append(lunch)
            for participant in lunch.participants {
                data.append(participant)
            }
        }
        
        return data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!

        if indexPath.row == 0 {
            
            let contactCell = tableView.dequeueReusableCell(withIdentifier: "MainContact", for: indexPath) as! MainContactCell
            contactCell.setup(user: data[0] as! User, color: CRColor.allRandoms[0])
            cell = contactCell
        }
        else if let user = data[indexPath.row] as? User {
            
            let contactCell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath) as! ContactCell
            contactCell.setup(user: user, color: CRColor.allRandoms[indexPath.row])
            cell = contactCell
        } else if let lunch = data[indexPath.row] as? Lunch {
            
            let dateCell = tableView.dequeueReusableCell(withIdentifier: "Date", for: indexPath) as! DateCell
            dateCell.setup(lunch: lunch)
            cell = dateCell
        }

        
        return cell
    }
    
}
