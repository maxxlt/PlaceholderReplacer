//
//  MyService.swift
//  PlaceholderReplacer
//
//  Created by Max Chan on 2/22/23.
//

import UIKit
import Alamofire

class MyService: MyRepo {
    func getImage(
        successHandler: @escaping (UIImage?) -> Void,
        errorHandler: @escaping (MyRepoError) -> Void
    ) {
        let url = "https://picsum.photos/200"
        
        AF.request(
            url,
            method: .get
        )
        .validate()
        .response { response in
            switch response.result {
                case .success(let data):
                    guard let data = data
                    else {
                        errorHandler(MyRepoError.NO_DATA_RECEIVED)
                        return
                    }
                    
                    successHandler(UIImage(data: data, scale: 1))
                    
                case .failure:
                    errorHandler(MyRepoError.FAILED_RESPONSE)
            }
        }
    }
}
