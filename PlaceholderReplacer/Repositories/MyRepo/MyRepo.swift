//
//  MyRepo.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import UIKit

protocol MyRepo {
    func getImage(
        successHandler: @escaping (UIImage?) -> Void,
        errorHandler: @escaping (MyRepoError) -> Void
    )
}

enum MyRepoError: Error {
    case NO_DATA_RECEIVED
    case FAILED_RESPONSE
}
