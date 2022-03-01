//
//  OutSeveralImagesCell.swift
//  TA1Swift
//
//  Created by EGOR TREPOV on 27.02.2022.
//

import UIKit

class OutSeveralImagesCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var imagesCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var mediaUrls:[NSURL] = []
    var parent:ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainView.layer.masksToBounds = true
        self.mainView.layer.cornerRadius = 12
        self.timeView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onFirstPhotoClick() {
        parent.showPhoto(url: mediaUrls[0])
    }
    
    @IBAction func onSecondPhotoClick() {
        parent.showPhotoCollection(urls: mediaUrls)
    }
}
