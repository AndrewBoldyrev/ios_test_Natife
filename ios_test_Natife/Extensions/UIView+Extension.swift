//
//  UIView+Extension.swift
//  ios_test_Natife
//
//  Created by Andrew Boldyrev on 18.01.2023.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0)
    }
}
