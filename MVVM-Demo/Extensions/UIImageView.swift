//
//  UIImageView.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func downloadFromLink(url:String,contentMode:UIView.ContentMode){
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.contentMode = contentMode
                if let data = data {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
