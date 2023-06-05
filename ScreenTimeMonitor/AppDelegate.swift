//
//  AppDelegate.swift
//  ScreenTimeMonitor
//
//  Created by Apple on 27/05/2023.
//

import UIKit
import CoreData
import FamilyControls

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        AuthorizationCenter.shared.requestAuthorization { result in
            
            switch result {
                
            case .success:
                print("Success")
                
            case .failure(let error):
                print("error for screentime is \(error)")
            }
        }
        
        _ = AuthorizationCenter.shared.$authorizationStatus
            .sink() {_ in
                
                switch AuthorizationCenter.shared.authorizationStatus {
                    
                case .notDetermined:
                    print("not determined")
                    
                case .denied:
                    print("denied")
                    
                case .approved:
                    print("approved")
                    
                @unknown default:
                    break
                }
            }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

