//
//  AppDelegate.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        LaunchManager.shared.launched()
        self.setupIntegrations()
        
        return true
    }
    
    private func setupIntegrations() {
        // TODO: Setup integrations here
    }
}

