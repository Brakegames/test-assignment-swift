//
//  PhotoCollectionController.swift
//  TA1Swift
//
//  Created by EGOR TREPOV on 28.02.2022.
//

import UIKit

class PhotoCollectionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var photoCollection: UICollectionView!
    
    var mediaUrls:[NSURL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoCollection.delegate = self
        self.photoCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionCell
        cell.photoView.sd_setImage(with: mediaUrls[indexPath.row] as URL, placeholderImage: UIImage(named: "placeholder"))
        cell.mediaUrl = mediaUrls[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "photoViewer") as! PhotoViewerController
        controller.mediaUrl = mediaUrls[indexPath.row]
        self.present(controller, animated: true)
    }
}
