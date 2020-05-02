//
//  PhotoViewModel.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

protocol PhotoViewModelDelegate {
    func showLoading()
    func hideLoading()
    func showErrorAlert(error:String)
    func loadedSuccess()
    func showPhotoDetails(photo:Photo)
}

class PhotoViewModel: NSObject {
 var delegate:PhotoViewModelDelegate
 var listView = true
    init(delegate:PhotoViewModelDelegate){
        self.delegate = delegate
    }
    
 fileprivate var photos = [Photo]()
    
 func loadPhotosFromServer(){
    delegate.showLoading()
    FetchPhotoApiCall().fetchPhotos(url: Constants.UrlConstants.url!) { (result) in
        self.delegate.hideLoading()
        switch result{
        case .failure(let error):
            self.delegate.showErrorAlert(error: error.errorMessage)
        case .success(let data):
            do {
                self.photos = try JSONDecoder().decode([Photo].self, from: data)
                self.delegate.loadedSuccess()
            }catch{
                self.delegate.showErrorAlert(error: error.localizedDescription)
            }
        }
    }
 }
}

extension PhotoViewModel:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.photoCellIndentifier, for: indexPath) as! PhotoCollectionViewCell
        let photo = photos[indexPath.row]
        cell.setCellData(photo: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate.showPhotoDetails(photo: photos[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthPerItem : CGSize
        if listView {
             widthPerItem = CGSize(width: 300, height: 300)
        }
        else{
            widthPerItem = CGSize(width: 100, height: 100)
        }
        return widthPerItem
    }
}
