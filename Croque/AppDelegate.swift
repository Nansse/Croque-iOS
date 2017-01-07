//
//  AppDelegate.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 01/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Lunch.all = [Lunch(question: "Brune ou blonde ?", answers: ["Brune", "Blonde", "On parle de bière là ?"]), Lunch(question: "Votre forme géométrique ?", answers: ["Le carré, c'est la rigueur, la solidité", "Le rond, c'est la créativité, l'infini", "Le triangle, c'est l'harmonie, la sagesse", "L'étoile, parce que c'est joli"])]
        Lunch.all[0].answer = 0
        Lunch.all[1].participants.append(User())

        Lunch.all[1].answer = 2
        
        setEntryPoint(to: .home)
        
        return true
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Entry point
    
    private enum EntryPoint: String {
        case home = "Home"
        case login = "Login"
        case tutorial = "Tutorial"
    }
    
    /**
     Sets the entrypoint of the application by loading the application's window manually
     */
    private func setEntryPoint(to entryPoint: EntryPoint) {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = mainStoryboard.instantiateViewController(withIdentifier: entryPoint.rawValue)
        
        self.window?.rootViewController = loginVC
        
        self.window?.makeKeyAndVisible()
    }
}

