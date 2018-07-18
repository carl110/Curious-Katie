//
//  UIButton+extensions.swift
//  Curious Katie
//
//  Created by Carl Wainwright on 18/07/2018.
//  Copyright © 2018 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func enableButton() {
        alpha = 1.0
        isEnabled = true
    }
    
    func disableButton() {
        alpha = 0.17
        isEnabled = false
    }
}
