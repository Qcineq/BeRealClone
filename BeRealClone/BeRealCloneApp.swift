//
//  BeRealCloneApp.swift
//  BeRealClone
//
//  Created by Jakub Kuciński on 29/08/2023.
//

import SwiftUI
import FirebaseCore

@main
struct BeRealCloneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainAuthView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
