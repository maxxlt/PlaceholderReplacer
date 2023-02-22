//
//  LaunchView.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import UIKit
import SnapKit

class LaunchView: UIView {
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }
    
    private func setup() {
        backgroundColor = .white
        constrain()
    }
    
    private func constrain(){
        label.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    // MARK: - Lazy Loads
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "PlaceholderReplacer"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        
        addSubview(label)
        return label
    }()
}
