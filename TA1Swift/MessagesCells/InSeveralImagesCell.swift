//
//  InSeveralMessagesCell.swift
//  TA1Swift
//
//  Created by EGOR TREPOV on 27.02.2022.
//

import UIKit

class InSeveralImagesCell: UITableViewCell {

    @IBOutlet weak var companionName: UILabel!
    @IBOutlet weak var companionMeta: UILabel!
    @IBOutlet weak var companionView: UIView!
    @IBOutlet weak var companionInitials: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imagesCountLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var timeView: UIView!
    
    var mediaUrls:[NSURL] = []
    var parent:ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.companionView.layer.cornerRadius = 18
        self.mainView.layer.masksToBounds = true
        self.mainView.layer.cornerRadius = 12
        self.firstImage.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        self.firstImage.layer.cornerRadius = 12
        self.secondImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        self.secondImage.layer.cornerRadius = 12
        self.shadowView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        self.shadowView.layer.cornerRadius = 12
        
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
