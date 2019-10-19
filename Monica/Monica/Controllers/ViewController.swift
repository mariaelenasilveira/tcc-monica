////
////  ViewController.swift
////  Monica
////
////  Created by Mariaelena Silveira on 12/10/19.
////  Copyright © 2019 Mariaelena Silveira. All rights reserved.
////
//
//import UIKit
//import FirebaseDatabase
//
//class DetalhesViewController: UIViewController {
//
//    @IBOutlet weak var button: UISwitch!
//    @IBOutlet weak var label: UILabel!
//    
//var ref: DatabaseReference!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        ref = Database.database().reference()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        button.isHidden = true
//        label.isHidden = true
//        lerEstadoRegistro()
//    }
//    
//    func lerEstadoRegistro(){
//        ref.child("empresa1/caixa1/registro").observeSingleEvent(of: .value) {(snapshot) in
//            guard let estado = snapshot.value as? Bool else { return }
//            if estado {
//                self.button.isOn = true
//                self.label.text = "Ligado"
//            } else {
//                self.button.isOn = false
//                self.label.text = "desligado"
//            }
//            
//            self.button.isHidden = false
//            self.label.isHidden = false
//        }
//    }
//
//    @IBAction func registro(_ sender: Any) {
//        if button.isOn {
//            label.text = "Ligado"
//            ref.child("empresa1/caixa1/registro").setValue(true)
//        } else {
//            label.text = "desligado"
//            ref.child("empresa1/caixa1/registro").setValue(false)
//        }
//
//    }
//}
//
