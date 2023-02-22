//
//  MyFeatureViewController.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import Combine
import UIKit

class MyFeatureViewController: UIViewController {
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Overrides
    override func loadView() {
        view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - Private vars
    private var observables = Set<AnyCancellable>()
    
    // MARK: - Private methods
    private func setupBindings() {
        observables = [
            viewModel.$state
                .receive(on: DispatchQueue.main)
                .assign(to: \.state, on: customView),
            viewModel.$image
                .receive(on: DispatchQueue.main)
                .sink { [weak self] image in
                    guard let image = image
                    else { return }
                    
                    self?.customView.myImageView.image = image
                },
            customView.actionPublisher
                .receive(on: DispatchQueue.main)
                .sink { [weak self] action in
                    switch action {
                        case .generateImage:
                            self?.viewModel.getImage()
                    }
                }
        ]
    }
    
    // MARK: - Lazy vars
    private lazy var customView: MyFeatureView = {
        MyFeatureView()
    }()
    
    private lazy var viewModel: MyFeatureViewModel = {
        MyFeatureViewModel(repo: MyService())
    }()
}
