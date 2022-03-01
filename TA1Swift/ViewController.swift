//
//  ViewController.swift
//  TA1Swift
//
//  Created by Ivan Manov on 29.03.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var companionView: UIView!
    @IBOutlet weak var messagesTable: UITableView!
    
    var messagesArray:[SampleMessage] = []
    
    var keyboardIsShown = false
    var kboardHeight = CGFloat(0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.messagesTable.delegate = self
        self.messagesTable.dataSource = self
        
        self.companionView.layer.cornerRadius = 18
        
        let sampleDataSource = SampleDataSource()
        sampleDataSource.loadMessages { (messages) in
            self.messagesArray = messages
            self.messagesTable.reloadData()
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messagesArray[indexPath.row]
        let messageMedia = message.media ?? []
        let sender = message.sender
        switch sender?.senderId {
        case "00":
            switch message.media?.count {
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "outOneImage") as! OutOneImageCell
                cell.messageImage?.sd_setImage(with: messageMedia[0] as URL, placeholderImage: UIImage(named: "placeholder"))
                cell.mediaUrl = messageMedia[0]
                cell.parent = self
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "outSeveralImages") as! OutSeveralImagesCell
                cell.imagesCountLabel.text = "+ \(messageMedia.count - 1)"
                cell.firstImage?.sd_setImage(with: messageMedia[0] as URL, placeholderImage: UIImage(named: "placeholder"))
                cell.secondImage?.sd_setImage(with: messageMedia[1] as URL, placeholderImage: UIImage(named: "placeholder"))
                cell.mediaUrls = messageMedia
                cell.parent = self
                return cell
            }
        default:
            let companionNameParts = message.sender?.senderFullName.split(separator: " ")
            var companionInitials = String(companionNameParts![0].first!)
            if companionNameParts!.count > 1 {
                companionInitials += String(companionNameParts![1].first!)
            }
            switch message.media?.count {
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "inOneImage") as! InOneImageCell
                cell.companionName.text = message.sender?.senderFullName
                cell.companionMeta.text = message.sender?.senderMeta
                cell.companionInitials.text = companionInitials
                cell.messageImage?.sd_setImage(with: messageMedia[0] as URL, placeholderImage: UIImage(named: "placeholder"))
                cell.mediaUrl = messageMedia[0]
                cell.parent = self
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "inSeveralImages") as! InSeveralImagesCell
                cell.companionName.text = message.sender?.senderFullName
                cell.companionMeta.text = message.sender?.senderMeta
                cell.companionInitials.text = companionInitials
                cell.imagesCountLabel.text = "+ \(messageMedia.count - 1)"
                cell.firstImage?.sd_setImage(with: messageMedia[0] as URL, placeholderImage: UIImage(named: "placeholder"))
                cell.secondImage?.sd_setImage(with: messageMedia[1] as URL, placeholderImage: UIImage(named: "placeholder"))
                cell.mediaUrls = messageMedia
                cell.parent = self
                return cell
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func showPhoto(url: NSURL) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "photoViewer") as! PhotoViewerController
        controller.mediaUrl = url
        self.present(controller, animated: true)
    }
    
    public func showPhotoCollection(urls: [NSURL]) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "photoCollection") as! PhotoCollectionController
        controller.mediaUrls = urls
        self.present(controller, animated: true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if !keyboardIsShown {
            if kboardHeight == 0 {
                if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let keyboardRectangle = keyboardFrame.cgRectValue
                    let keyboardHeight = keyboardRectangle.height
                    kboardHeight = keyboardHeight
                }
            }
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame.size.height -= self.kboardHeight
            })
            keyboardIsShown = true
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if keyboardIsShown {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame.size.height += self.kboardHeight
            })
            keyboardIsShown = false
        }
    }
}

