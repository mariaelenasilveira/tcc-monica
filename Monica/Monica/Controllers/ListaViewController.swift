//
//  ListaViewController.swift
//  Monica
//
//  Created by Mariaelena Silveira on 14/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let listaCaixas = ["Reservatório térreo"]
    var menuLateralAberto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verificarLogin()
        
        totalLabel.text = "Total: \(listaCaixas.count)"
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(desativarView),
                                               name: NSNotification.Name("EsconderMenuLateral"),
                                               object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTocada))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func desativarView() {
        menuLateralAberto = !menuLateralAberto
        if menuLateralAberto {
            view.alpha = 0.5
        } else {
            view.alpha = 1
        }
        tableView.isUserInteractionEnabled = !menuLateralAberto
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func viewTocada() {
        if menuLateralAberto {
            esconderMenuLateral()
        }
    }
    
    func esconderMenuLateral() {
        NotificationCenter.default.post(name: NSNotification.Name("EsconderMenuLateral"), object: nil)
    }

    @IBAction func abrirMenuLateral(_ sender: Any) {
        esconderMenuLateral()
    }
    
    func verificarLogin(){
        if !UserDefaults.standard.bool(forKey: "autenticado") {
            abrirLogin()
        }
    }
    
    func abrirLogin() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(viewController, animated: true, completion: nil)
    }
}

extension ListaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaCaixas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celula = Bundle.main.loadNibNamed("CaixasTableViewCell", owner: self, options: nil)?.first as? CaixasTableViewCell else { return UITableViewCell() }

        celula.nomeReservatorioLabel.text = listaCaixas[indexPath.row]

        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.performSegue(withIdentifier: "DetalhesSegue", sender: self)
    }
}
