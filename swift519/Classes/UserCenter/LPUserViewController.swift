//
//  LPUserViewController.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/14.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPUserViewController: LPBaseViewController {

    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        textView.pl
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textChange(_ sender: UITextField) {
        print(sender.text ?? "")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
