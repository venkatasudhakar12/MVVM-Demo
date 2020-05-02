//
//  PhotosViewController.swift
//  MVVM-Demo
//
//  Created by Sudhakar on 02/05/20.
//  Copyright © 2020 Sudhakar. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var vm : PhotoViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = PhotoViewModel(delegate: self)
        vm.loadPhotosFromServer()
        photoCollectionView.delegate = vm
        photoCollectionView.dataSource = vm
        // Do any additional setup after loading the view.
    }
    @IBAction func actionForSegment(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            vm.listView = true
        case 1:
            vm.listView = false
           
        default:
            print("")
        }
         self.photoCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.showImage {
            let destination = segue.destination as? PhotoDetailViewController
            destination?.photo = sender as? Photo
        }
    }
}

extension PhotosViewController:PhotoViewModelDelegate{
    func showLoading(){
        showLoader()
    }
    
    func hideLoading() {
        hideLoader()
    }
    
    func showErrorAlert(error: String) {
        showAlert(mesage: error)
    }
    
    func loadedSuccess() {
        DispatchQueue.main.async {
             self.photoCollectionView.reloadData()
        }
       
    }
    func showPhotoDetails(photo: Photo) {
        self.performSegue(withIdentifier: Constants.showImage, sender: photo)
    }
}
