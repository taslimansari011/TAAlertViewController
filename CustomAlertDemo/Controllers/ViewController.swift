//
//  ViewController.swift
//  CustomAlertDemo
//
//  Created by Taslim Ansari on 23/10/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var msgLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        if let alert = CommonMethods.alertController {
            alert.alertTitle = "Message"
            alert.alertMsg = "A quick brown fox jumps over a white lazy dog."
            alert.addCustomAlertAction(title: "Ok", target: self, selector: #selector(okButtonTapped))
            alert.addCustomAlertAction(title: "Dismiss") { (sender) in
                self.setMsgLabelWith(text: sender.titleLabel?.text)
            }
            alert.addCustomAlertAction(title: "Cancel") { (sender) in
                self.setMsgLabelWith(text: sender.titleLabel?.text)
            }
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func okButtonTapped() {
        print("Ok Tapped")
        setMsgLabelWith(text: "Ok")
    }
    
    func setMsgLabelWith(text: String?) {
        msgLabel.text = text
    }
}

