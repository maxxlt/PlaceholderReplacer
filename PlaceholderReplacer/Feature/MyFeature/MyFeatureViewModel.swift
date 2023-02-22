//
//  MyFeatureViewModel.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import UIKit
import Combine

class MyFeatureViewModel {
    
    // MARK: - Public vars
    func getImage() {
        self.state = .loading
        
        repo.getImage(
            successHandler: { image in
                self.image = image
                self.state = .done
            },
            errorHandler: { error in
                
                // TODO: You can handle specific types of error here
                switch error {
                    case .NO_DATA_RECEIVED: break
                    case .FAILED_RESPONSE: break
                }
                
                self.state = .error
            }
        )
    }
    
    // MARK: - Published vars
    @Published private(set) var state: MyFeatureView.State = .done
    @Published private(set) var image: UIImage?
    
    // MARK: - Inits
    init(repo: MyRepo) {
        self.repo = repo
    }
    
    // MARK: - Private vars
    private let repo: MyRepo
}
