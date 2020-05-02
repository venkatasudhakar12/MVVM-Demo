//
//  ServiceCallProtocol.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import Foundation

enum NetworkError{
    case networkError
    case fetchError
    
    var errorMessage:String{
        switch self {
        case .networkError: return "Something went wrong!"
        case .fetchError: return "Unable to Fetch!"
    }
  }
}

enum NetworkResult{
    case success(Data)
    case failure(NetworkError)
}
    
protocol ServiceCallProtocol{
    func fetchPhotos(url:URL,completionHandler:@escaping (NetworkResult) -> Void)
}
