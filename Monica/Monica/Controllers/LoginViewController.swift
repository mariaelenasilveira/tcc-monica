//
//  LoginViewController.swift
//  Monica
//
//  Created by Mariaelena Silveira on 15/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var entrarButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        entrarButton.arredondarBordas()
    }

    @IBAction func entrar(_ sender: Any) {
        verificarLogin()
    }
    
    func verificarLogin(){
        guard let login = usernameTextField.text else { return }
        guard let senha = senhaTextField.text else { return }
        ref.child("empresa1/caixa1/\(login)").observeSingleEvent(of: .value) {(snapshot) in
            guard let valor = snapshot.value as? String else { return }
            if valor == senha {
                self.logar()
            } else {
                
            }
        }
    }
    
    
    
    func logar(){
        let configuracoesSalvas = UserDefaults.standard
        configuracoesSalvas.set(true, forKey: "autenticado")
        self.dismiss(animated: true, completion: nil)
    }
}
