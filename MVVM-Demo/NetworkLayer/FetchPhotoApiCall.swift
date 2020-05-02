//
//  FetchPhotoApiCall.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import Foundation
import UIKit

class FetchPhotoApiCall:ServiceCallProtocol {
    
    func fetchPhotos(url: URL, completionHandler: @escaping (NetworkResult) -> Void) {
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url) { (data, repsonse, error) in
                guard let data = data else{
                    DispatchQueue.main.async {
                        completionHandler(NetworkResult.failure(.fetchError))
                    }
                    return
                }
                completionHandler(NetworkResult.success(data))
            }.resume()
        }
        
    }
}
