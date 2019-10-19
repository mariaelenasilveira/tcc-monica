//
//  UIButtonExtension.swift
//  Monica
//
//  Created by Mariaelena Silveira on 17/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//
import UIKit

extension UIButton {
    func arredondarBordas(){
        self.layer.cornerRadius = self.frame.size.height/2
    }
}
