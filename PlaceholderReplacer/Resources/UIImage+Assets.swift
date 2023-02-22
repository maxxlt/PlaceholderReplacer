//
//  UIImage+Assets.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import UIKit

extension UIImage {
    static func named(_ name: ImageAssetName) -> UIImage {
        return UIImage(named: name.rawValue) ?? UIImage()
    }
}

enum ImageAssetName: String {
    case placeholder
}
