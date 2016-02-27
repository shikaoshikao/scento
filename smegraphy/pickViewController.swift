//
//  pickViewController.swift
//  smemory
//
//  Created by yoshikik on 2016/02/21.
//  Copyright © 2016年 Yoshiki Kawakita. All rights reserved.
//

import UIKit

class pickViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!
    @IBOutlet weak var ImageView3: UIImageView!
    var whichImage:Int!
    //var imageView = UIImageView(image:UIImage(named:"pic1.jpg"))
    
    let TagImageView: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ImageView.tag = TagImageView
        ImageView2.tag = 2
        ImageView3.tag = 3
        
        self.ImageView.layer.borderColor = UIColor.blackColor().CGColor
        self.ImageView.layer.borderWidth = 3
        self.ImageView2.layer.borderColor = UIColor.blackColor().CGColor
        self.ImageView2.layer.borderWidth = 3
        self.ImageView3.layer.borderColor = UIColor.blackColor().CGColor
        self.ImageView3.layer.borderWidth = 3
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
        ImageView.userInteractionEnabled = true
        ImageView2.userInteractionEnabled = true
        ImageView3.userInteractionEnabled = true
        ImageView.addGestureRecognizer(tapGestureRecognizer)
        ImageView2.addGestureRecognizer(tapGestureRecognizer2)
        ImageView3.addGestureRecognizer(tapGestureRecognizer3)
    }
    
    
    func imageTapped(sender: UITapGestureRecognizer){
        let iv = sender.view as! UIImageView
        switch iv.tag{
        case 1:
            print("Tapped!")
            whichImage = 1
        case 2:
            print("2tapped")
            whichImage = 2
        case 3:
            whichImage = 3
            print("3tapped")
        default:
            break
        }
        var aa = showAlbum(self)
    }
    
    
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            switch whichImage{
            case 1:
                print("Tapped!")
                //                ImageView.contentMode = .ScaleAspectFit
                ImageView.image = pickedImage
            case 2:
                print("2tapped")
                //                ImageView2.contentMode = .ScaleAspectFit
                ImageView2.image = pickedImage
            case 3:
                whichImage = 3
                //                ImageView3.contentMode = .ScaleAspectFit
                ImageView3.image = pickedImage
                print("3tapped")
            default:
                break
            }
            
            
            //            cameraView.contentMode = .ScaleAspectFit
            //            cameraView.image = pickedImage
        }
        //閉じる処理
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        self.ImageView.layer.masksToBounds = true
        self.ImageView2.layer.masksToBounds = true
        self.ImageView3.layer.masksToBounds = true
    }
    
    
    func showAlbum(sender : AnyObject) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
            //            label.text = "Tap the [Start] to save a picture"
        }
        else{
            //            label.text = "error"
        }
    }
}