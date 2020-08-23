//
//  UIView.swift
//  TopPop
//
//  Created by Natalija Krsnik on 20/08/2020.
//  Copyright © 2020 Natalija. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**Sets the background of the view*/
    func addBackgroundImg(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
    }
}
