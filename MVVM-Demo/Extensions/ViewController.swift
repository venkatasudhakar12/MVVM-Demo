//
//  ViewController.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    
internal func showLoader() {
     DispatchQueue.main.async {
    let alert = UIAlertController(title: nil, message: Constants.pleaseWait , preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = UIActivityIndicatorView.Style.large
    loadingIndicator.startAnimating();
    alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
}


internal func hideLoader() {
     DispatchQueue.main.async {
    if let vc = self.presentedViewController, vc is UIAlertController {
        self.dismiss(animated: false, completion: nil )
    }
    }
}
    func showAlert(mesage:String){
        DispatchQueue.main.async {
            let alert = UIAlertController.init(title: Constants.alert, message: mesage, preferredStyle: UIAlertController.Style.alert)
            let dismissAction = UIAlertAction.init(title: Constants.ok, style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(dismissAction)
            self.present(alert, animated: true, completion: nil)
         }
    }
}
