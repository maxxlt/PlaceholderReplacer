//
//  LaunchViewController.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import Combine
import UIKit

class LaunchViewController: UIViewController {

    // MARK: - Overrides
    override func loadView() {
        view = customView
    }
    
    // MARK: - Lazy vars
    private lazy var customView: LaunchView = {
        LaunchView()
    }()
}
