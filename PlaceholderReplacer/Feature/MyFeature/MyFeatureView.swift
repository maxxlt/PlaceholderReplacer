//
//  MyFeatureView.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import Combine
import UIKit

class MyFeatureView: UIView {

    enum State {
        case loading, done, error
    }

    // MARK: - Public vars
    var actionPublisher = PassthroughSubject<Action, Never>()
    var state: State = .loading {
        didSet {
            switch self.state {
                case .loading:
                    contentStack.addArrangedSubview(loadingView)
                    loadingView.startAnimating()
                    errorLabel.removeFromSuperview()
                    
                case .done:
                    loadingView.removeFromSuperview()
                    errorLabel.removeFromSuperview()
                    
                case .error:
                    loadingView.removeFromSuperview()
                    contentStack.addArrangedSubview(errorLabel)
            }
        }
    }
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }
    
    private func setup() {
        backgroundColor = .black
        constrain()
    }
    
    private func constrain(){
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(32)
            $0.centerX.equalTo(self)
        }
        contentStack.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    // MARK: - Private vars
    
    // MARK: - Private methods
    @objc private func onGenerateImage() {
        actionPublisher.send(.generateImage)
    }
    
    // MARK: - Lazy Loads
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PlaceholderReplacer"
        label.textColor = .white
        label.font = .systemFont(ofSize: 32)
        
        addSubview(label)
        return label
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 8
        
        stack.addArrangedSubview(myImageView)
        stack.addArrangedSubview(generateImageButton)
        
        addSubview(stack)
        return stack
    }()
    
    private(set) lazy var myImageView: UIImageView = {
        let view = UIImageView()
        view.image = .named(.placeholder)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var loadingView = UIActivityIndicatorView()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Something went wrong. Please try again"
        label.textColor = .red
        
        return label
    }()
    
    private lazy var generateImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Generate Image", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        button.setTitleColor(.cyan.withAlphaComponent(0.5), for: .highlighted)
        
        button.addTarget(
            self,
            action: #selector(onGenerateImage),
            for: .touchUpInside
        )
        
        return button
    }()
}

extension MyFeatureView {
    enum Action {
        case generateImage
    }
}
