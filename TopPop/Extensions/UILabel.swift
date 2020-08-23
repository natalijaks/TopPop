//
//  UILabel.swift
//  TopPop
//
//  Created by Natalija Krsnik on 22/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    /**
     Sets label shadow
      - Parameters:
            - color: Color of the shadow
     */
    func shadow(_ color: UIColor) {
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 3
        self.layer.shadowColor = color.cgColor
        
    }
}
