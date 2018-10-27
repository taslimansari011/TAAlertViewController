//
//  UIViewController+Extension.swift
//  CustomAlertDemo
//
//  Created by Taslim Ansari on 27/10/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    static var topVC: UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
            // topController should now be your topmost view controller
        }
        return nil
    }
}

