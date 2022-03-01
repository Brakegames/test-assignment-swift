//
//  PhotoViewerController.swift
//  TA1Swift
//
//  Created by EGOR TREPOV on 28.02.2022.
//

import UIKit

class PhotoViewerController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    
    var mediaUrl: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoView.sd_setImage(with: mediaUrl as URL, placeholderImage: UIImage(named: "placeholder"))
    }
    
    @IBAction func onBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
