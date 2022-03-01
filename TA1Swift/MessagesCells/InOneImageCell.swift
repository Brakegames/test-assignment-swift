//
//  InOneImageCell.swift
//  TA1Swift
//
//  Created by EGOR TREPOV on 27.02.2022.
//

import UIKit

class InOneImageCell: UITableViewCell {

    @IBOutlet weak var companionName: UILabel!
    @IBOutlet weak var companionMeta: UILabel!
    @IBOutlet weak var companionView: UIView!
    @IBOutlet weak var companionInitials: UILabel!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var timeView: UIView!
    
    var mediaUrl:NSURL!
    var parent:ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.companionView.layer.cornerRadius = 18
        self.mainView.layer.masksToBounds = true
        self.mainView.layer.cornerRadius = 12
        
        self.timeView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onPhotoClick() {
        parent.showPhoto(url: mediaUrl)
    }
}
