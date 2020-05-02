//
//  PhotoDetailViewController.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    var photo : Photo!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = photo.title
        self.photoImg.downloadFromLink(url: photo.url, contentMode: .scaleToFill)
        // Do any additional setup after loading the view.
    }


}
