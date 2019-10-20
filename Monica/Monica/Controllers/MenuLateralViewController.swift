//
//  MenuLateralViewController.swift
//  Monica
//
//  Created by Mariaelena Silveira on 18/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit

class MenuLateralViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func deslogar(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "autenticado")
        NotificationCenter.default.post(name: NSNotification.Name("EsconderMenuLateral"), object: nil)
        abrirLogin()
    }
    
    func abrirLogin() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func sobre(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SobreViewController") as! SobreViewController
        self.present(viewController, animated: true, completion: nil)
    }
}
