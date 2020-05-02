//
//  PhotoCollectionViewCell.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    func setCellData(photo:Photo){
        self.name.text = photo.title
        self.photo.downloadFromLink(url: photo.url, contentMode: .scaleToFill)
    }
}
