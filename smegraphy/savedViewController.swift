//
//  savedViewController.swift
//  smegraphy
//
//  Created by yoshikik on 2016/02/22.
//  Copyright © 2016年 Yoshiki Kawakita. All rights reserved.
//

import UIKit

class savedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func nextPic (sender: AnyObject){
    navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
