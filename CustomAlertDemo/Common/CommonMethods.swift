//
//  CommonMethods.swift
//  CustomAlertDemo
//
//  Created by Taslim Ansari on 29/10/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit
import Foundation

struct Storyboard {
    static var main: UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
}

class CommonMethods: NSObject {
    
    static var alertController: CustomAlertViewController? {
        return Storyboard.main.instantiateViewController(withIdentifier: "CustomAlertViewController") as? CustomAlertViewController
    }
}
