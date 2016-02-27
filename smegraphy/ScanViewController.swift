//
//  ScanViewController.swift
//  smegraphy
//
//  Created by yoshikik on 2016/02/22.
//  Copyright © 2016年 Yoshiki Kawakita. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {

    @IBOutlet var label : UILabel?
    @IBOutlet var progressView : UIProgressView?
    var timer : NSTimer!
    var countNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countNum = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        progressView!.setProgress(0, animated: true)
        
    }
    
    func update() {
        label!.text = "\(countNum)%"
        countNum++
        progressView!.progress = Float(countNum)/100
//        while countNum < 100{
//            countNum++
//        }
        if countNum > 100{
            timer.invalidate()
            moveTosaved()
        }
    }
    
    func moveTosaved() {
        performSegueWithIdentifier("toSavedSegue",sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
