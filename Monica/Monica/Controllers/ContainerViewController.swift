//
//  ContainerViewController.swift
//  Monica
//
//  Created by Mariaelena Silveira on 18/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var menuLateralConstraint: NSLayoutConstraint!
    var menuLateralAberto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(esconderMenuLateral), name: NSNotification.Name("EsconderMenuLateral"), object: nil)
    }
    
    @objc func esconderMenuLateral() {
        menuLateralAberto = !menuLateralAberto
        if menuLateralAberto {
            menuLateralConstraint.constant = 270
        } else {
            menuLateralConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}
