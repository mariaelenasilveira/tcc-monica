//
//  LoginViewController.swift
//  Monica
//
//  Created by Mariaelena Silveira on 15/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var entrarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entrarButton.arredondarBordas()
    }

    @IBAction func entrar(_ sender: Any) {
        verificarLogin()
    }
    
    func verificarLogin(){
        logar()
    }
    
    func logar(){
        let configuracoesSalvas = UserDefaults.standard
        configuracoesSalvas.set(true, forKey: "autenticado")
        self.dismiss(animated: true, completion: nil)
    }
}
