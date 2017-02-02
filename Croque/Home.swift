//
//  Home.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 02/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit
import Alamofire

class Home: UIViewController {
    
    static var shared: Home!
    
    // MARK: - Container View Controllers
    
    @IBOutlet var container: UIView!
    
    lazy var openVC: HomeOpen = {
        return self.storyboard?.instantiateViewController(withIdentifier: "HomeOpen") }() as! HomeOpen
    
    lazy var closedVC: UIViewController! = {
        return self.storyboard?.instantiateViewController(withIdentifier: "HomeClosed") }()
    
    lazy var waitingVC: UIViewController! = {
        return self.storyboard?.instantiateViewController(withIdentifier: "HomeWaiting") }()
    
    lazy var foundedVC: HomeFounded = {
        return self.storyboard?.instantiateViewController(withIdentifier: "HomeFounded") }() as! HomeFounded
    
    var presentedVC: UIViewController?
    
    @IBOutlet weak var titleBar: TitleBar!
    
    var lunch: Lunch!
    
    override func viewDidLoad() {
        
        
//        //Test realm
//        
//        let a = Test()
//        a.a = "Test 1"
//        
//        let realm = try! Realm()
//        try! realm.write {
//            realm.add(a)
//        }
        
        
        Home.shared = self
        super.viewDidLoad()
        
        titleBar.setLeftButton(to: .settings, withTarget: { [unowned self] in
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "History")
            self.present(vc, animated: true, completion: nil)
            
            // Animation from right to left
            //self.performSegue(withIdentifier: "showHistory", sender: nil)
        })
        
        presentInContainer(viewController: closedVC)
        
        Alamofire.request("http://agepolysrv1.epfl.ch:8043").responseJSON(completionHandler: {response in
            let json = JSON(response.result.value!)
            if json != "CLOSED" {
                self.lunch = Lunch(json: json[0])
                self.presentInContainer(viewController: self.openVC)
            }
        })
        
        Alamofire.request("http://agepolysrv1.epfl.ch:8043/lunch").response(completionHandler: {response in
            print(response)
            let json = JSON(response)
            print(json)
            if json.string != "No lunch prepared yet" {
                self.foundedVC.lunch = Lunch.all[0]
                self.presentInContainer(viewController: self.foundedVC)
            }
        })
        
        //foundedVC.lunch = Lunch.all[0]
        //presentInContainer(viewController: foundedVC)
        
        //presentInContainer(viewController: waitingVC)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Removes the presented VC and presents a view controller in the containerView
    func presentInContainer(viewController vc: UIViewController) {
        removePresentedVCFromContainer()
        self.addChildViewController(vc)
        vc.view.frame = CGRect(x: 0, y: 0, width: container.frame.width, height: container.frame.height)
        self.container.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        presentedVC = vc
    }
    
    /// If there is a presented VC it will remove it from the container
    private func removePresentedVCFromContainer() {
        if let vc = presentedVC {
            vc.willMove(toParentViewController: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParentViewController()
        }
    }
}
