//
//  LaunchManager.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import UIKit

class LaunchManager {
    static let shared = LaunchManager()
    
    var window: UIWindow?
    
    func launched() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchViewController()
        window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.navigateNext()
        }
    }
    
    func navigateNext() {
        self.window?.rootViewController = MyFeatureViewController()
    }
}
