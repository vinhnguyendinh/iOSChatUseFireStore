//
//  CFProgressManager.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/20/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit
import SVProgressHUD

class CFProgressManager: NSObject {
    static let shared = CFProgressManager()
    
    private override init() {
        super.init()
        
    }
    
    func show() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func dismiss() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
