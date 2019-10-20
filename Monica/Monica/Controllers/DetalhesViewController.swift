//
//  ViewController.swift
//  Monica
//
//  Created by Mariaelena Silveira on 12/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DetalhesViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var detalhesCard: UIView!
    @IBOutlet weak var button: UISwitch!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var nivelAguaLabel: UILabel!
    @IBOutlet weak var valvulaCard: UIView!
    @IBOutlet weak var volumeMaximoLabel: UILabel!
    @IBOutlet weak var altoNivelImagem: UIImageView!
    @IBOutlet weak var statusReservatorioCard: UIView!
    @IBOutlet weak var atualizarButton: UIButton!
    @IBOutlet weak var nivelReservatorioLabel: UILabel!
    @IBOutlet weak var medioNivelImagem: UIImageView!
    @IBOutlet weak var baixoNivelImagem: UIImageView!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
        lerDados()
    }
    
    func configureUI() {
        let cor = UIColor(red: 170/255, green: 190/255, blue: 194/255, alpha: 1)
        valvulaCard.adicionarBordas(comCor: cor)
        valvulaCard.arredondarBordas()
        statusReservatorioCard.adicionarBordas(comCor: cor)
        statusReservatorioCard.arredondarBordas()
        detalhesCard.adicionarBordas(comCor: cor)
        detalhesCard.arredondarBordas()
        atualizarButton.arredondarBordas()
        viewCard.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func lerDados(){
        ref.child("empresa1/caixa1/registro").observeSingleEvent(of: .value) {(snapshot) in
            guard let estado = snapshot.value as? Bool else { return }
            if estado {
                self.button.isOn = true
                self.label.text = "Aberta"
            } else {
                self.button.isOn = false
                self.label.text = "Fechada"
            }
            self.viewCard.isHidden = false
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        
        ref.child("empresa1/caixa1/temperatura").observeSingleEvent(of: .value) {(snapshot) in
            guard let temperatura = snapshot.value as? Float else { return }
            self.temperaturaLabel.text = "\(temperatura)º C"
            self.temperaturaLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.lerDados()
            }
        }
        
        ref.child("empresa1/caixa1/sensor-baixo").observeSingleEvent(of: .value) {(snapshot) in
            guard let sensor = snapshot.value as? Bool else { return }
            if sensor {
                self.nivelAguaLabel.text = "Preenchimento baixo"
                self.nivelReservatorioLabel.text = "Baixo"
            } else {
                self.nivelReservatorioLabel.text = "Crítico"
                self.nivelAguaLabel.text = "Nível crítico"
            }
        }
        
        ref.child("empresa1/caixa1/sensor-medio").observeSingleEvent(of: .value) {(snapshot) in
            guard let sensor = snapshot.value as? Bool else { return }
            if sensor {
                self.nivelAguaLabel.text = "Preenchimento médio"
                self.nivelReservatorioLabel.text = "Médio"
                self.medioNivelImagem.isHidden = false
            } else {
                self.medioNivelImagem.isHidden = true
            }
        }
        
        ref.child("empresa1/caixa1/sensor-alto").observeSingleEvent(of: .value) {(snapshot) in
            guard let sensor = snapshot.value as? Bool else { return }
            if sensor {
                self.nivelAguaLabel.text = "Preenchimento Alto"
                self.nivelReservatorioLabel.text = "Alto"
                self.altoNivelImagem.isHidden = false
            } else {
                self.altoNivelImagem.isHidden = true
            }
        }
        
        ref.child("empresa1/caixa1/sensor-extravasor").observeSingleEvent(of: .value) {(snapshot) in
            guard let sensor = snapshot.value as? Bool else { return }
            if sensor {
                self.nivelAguaLabel.text = "Transbordou!!"
                self.nivelReservatorioLabel.text = "Transbordou!!"
                self.altoNivelImagem.isHidden = false
                self.medioNivelImagem.isHidden = false
            }
        }
    }
    
    @IBAction func atualizarTela(_ sender: Any) {
        viewCard.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        lerDados()
    }
    
    @IBAction func registro(_ sender: Any) {
        if button.isOn {
            label.text = "Ligado"
            ref.child("empresa1/caixa1/registro").setValue(true)
        } else {
            label.text = "desligado"
            ref.child("empresa1/caixa1/registro").setValue(false)
        }
        
    }
    @IBAction func voltar(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

