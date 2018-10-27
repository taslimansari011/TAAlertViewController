//
//  CustomAlertViewController.swift
//  CustomAlertDemo
//
//  Created by Taslim Ansari on 27/10/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit

typealias AlertActionCompletionandler = (UIButton) -> Void

class CustomAlertViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var alertContainerView: UIView!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var buttonsViewHeightConstraint: NSLayoutConstraint!
    
    var alertTitle: String? = ""
    var alertMsg: String? = ""
    var titleTextColor: UIColor = .black
    var msgTextColor: UIColor = .black
    var buttonsArray: [UIButton] = []
    var buttonTextColor = UIColor.init(red: 76/255.0, green: 138/255.0, blue: 247/255.0, alpha: 1)
    var completionHandler: [AlertActionCompletionandler] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupAlertView()
    }
}

// MARK: - Helper Methods
extension CustomAlertViewController {
    
    // MARK: - Setting up the alert view
    func setupAlertView() {
        
        self.view.layer.opacity = 0.5
        
        alertContainerView.layer.cornerRadius = 8
        alertContainerView.backgroundColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1)
        
        self.titleLabel.text = alertTitle
        titleLabel.textColor = self.titleTextColor
        self.msgLabel.text = alertMsg
        msgLabel.textColor = self.msgTextColor
        
        if buttonsArray.count > 2 {
            buttonsViewHeightConstraint.constant = CGFloat(buttonsArray.count * 40 + buttonsArray.count)
            for (index, button) in buttonsArray.enumerated() {
                let rect = CGRect.init(x: 0, y: (CGFloat)(40 * index + index), width: self.alertContainerView.frame.width + 30, height: 40)
                button.frame = rect
                buttonsView.addSubview(button)
                addHorizontalSeperatorToButtonsViewAt(index: index + 1)
            }
        } else {
            buttonsViewHeightConstraint.constant = 40
            let horStackView = UIStackView.init(frame: self.buttonsView.bounds)
            horStackView.axis = .horizontal
            horStackView.distribution = .fillEqually
            for (index, button) in buttonsArray.enumerated() {
                let rect = CGRect.init(x: (CGFloat)(self.view.frame.width * 0.66 / 2) * CGFloat(index), y: 0, width: self.alertContainerView.frame.width / 2 - 1, height: 39)
                button.frame = rect
                horStackView.addSubview(button)
                self.addVerticalSeperatorToStackViewAt(index: index)
            }
            self.buttonsView.addSubview(horStackView)
        }
    }
    
    func addHorizontalSeperatorToButtonsViewAt(index: Int) {
        let rect = CGRect.init(x: 0, y: CGFloat((index * 40) + index), width: self.view.frame.width * 0.66, height: 0.4)
        let sepView = UIView.init(frame: rect)
        sepView.backgroundColor = UIColor.init(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
        self.buttonsView.addSubview(sepView)
    }
    
    func addVerticalSeperatorToStackViewAt(index: Int) {
        if index > 0 {
            let rect = CGRect.init(x: CGFloat(self.view.frame.width * 0.66 / 2 - 1), y: 0, width: 0.3, height: 40)
            let sepView = UIView.init(frame: rect)
            sepView.backgroundColor = UIColor.init(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
            self.buttonsView.addSubview(sepView)
        }
    }
    
    // MARK: - Adding action buttons here
    // Adding alert with selector method present in the source view controller...
    func addCustomAlertAction(title: String?, target: UIViewController?, selector: Selector?) {
        let button = UIButton.init(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(buttonTextColor, for: .normal)
        button.addTarget(target ?? self, action: selector ?? #selector(dismissAlert), for: .touchUpInside)
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        buttonsArray.append(button)
    }
    
    // Adding action with completion handler...
    func addCustomAlertAction(title: String?, handler: AlertActionCompletionandler?) {
        let button = UIButton.init(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(buttonTextColor, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonsArray.append(button)
        button.tag = 9999
        if handler != nil {
            button.tag = completionHandler.count
            self.completionHandler.append(handler!)
        }
    }
    
    // MARK: Button actions...
    @objc func buttonAction(sender: UIButton) {
        if sender.tag < self.completionHandler.count {
            self.completionHandler[sender.tag](sender)
        }
        self.dismiss(animated: true) {
        }
    }
    
    @objc func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
}

// Extra code that may be useful..
