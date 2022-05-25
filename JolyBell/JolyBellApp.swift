//
//  JolyBellApp.swift
//  JolyBell
//
//  Created by Arseni Khatsuk on 25.05.2022.
//

import SwiftUI
import FirebaseCore
import Firebase


@main
struct JolyBellApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelagate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelagate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    
}
