//
//  AppDelegate.swift
//  Sumit
//
//  Created by Cole Wilkes on 11/11/16.
//  Copyright © 2016 via cole. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey("AIzaSyDSSMfuFX2ly2Qf1A0MaHawZ5Gc-L7w3Yw")
    
        let userController = UserController.sharedInstance
        //userController.logout()
        userController.loadUserLocal()
        
        var rootVC: UIViewController?
        
        let mapController = MapController.sharedInstance
 //
 //       mapController.selectUserDestinations { (success, error) in
 //           if !success {
 //               print("error app delegate")
 //           } else {
 //               DispatchQueue.main.async(execute: {
 //                   if userController.currentUser == nil {
 //                       rootVC = CreateVC()
 //                       self.window?.rootViewController = UINavigationController(rootViewController: rootVC!)
 //                   } else {
 //                       userController.currentUser = User(id: 7, user: "mtn_GOAT", score: 712)
 //                       mapController.mapVC?.addDestinations(destinations: mapController.destinations!)
                        rootVC = mapController.mapVC
                        let navigationController = UINavigationController(rootViewController:rootVC!)
                        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
                        navigationController.navigationBar.shadowImage = UIImage()
                        navigationController.navigationBar.isTranslucent = true
                        self.window?.rootViewController = navigationController
                        self.window?.makeKeyAndVisible()
    
 //                   }
 //               })
 //           }
 //       }

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


}

