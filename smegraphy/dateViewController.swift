//
//  dateViewController.swift
//  smegraphy
//
//  Created by yoshikik on 2016/02/22.
//  Copyright © 2016年 Yoshiki Kawakita. All rights reserved.
//

import UIKit

class dateViewController: UIViewController{
    private var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        // DatePickerを生成する.
        let myDatePicker: UIDatePicker = UIDatePicker()
        
        // datePickerを設定（デフォルトでは位置は画面上部）する.
        myDatePicker.frame = CGRectMake(0, 300, self.view.frame.width, 200)
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.backgroundColor = UIColor.whiteColor()
        myDatePicker.layer.cornerRadius = 5.0
//        myDatePicker.layer.shadowOpacity = 0.5
        
        // 値が変わった際のイベントを登録する.
        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
        
        // DataPickerをViewに追加する.
        self.view.addSubview(myDatePicker)
        
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,120,40))
        myTextField.text = ""
        myTextField.borderStyle = UITextBorderStyle.None
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 100);
        myTextField.textAlignment = NSTextAlignment.Center
        // UITextFieldをViewに追加する.
        self.view.addSubview(myTextField)
        
        // Do any additional setup after loading the view.
    }
    
    /*
    DatePickerが選ばれた際に呼ばれる.
    */
    internal func onDidChangeDate(sender: UIDatePicker){
        
        // フォーマットを生成.
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "MM/dd/yyyy"
        
        // 日付をフォーマットに則って取得.
        let mySelectedDate: NSString = myDateFormatter.stringFromDate(sender.date)
        myTextField.text = mySelectedDate as String
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
