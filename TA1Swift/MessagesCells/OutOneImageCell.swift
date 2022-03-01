//
//  OutOneImageCell.swift
//  TA1Swift
//
//  Created by EGOR TREPOV on 27.02.2022.
//

import UIKit

class OutOneImageCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var mediaUrl:NSURL!
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

    @IBAction func onPhotoClick() {
        parent.showPhoto(url: mediaUrl)
    }
    
}
