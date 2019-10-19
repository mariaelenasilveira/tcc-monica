//
//  UIViewExtension.swift
//  Monica
//
//  Created by Mariaelena Silveira on 17/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit

extension UIView {
    func adicionarBordas(comCor cor: UIColor, eTamanho tamanho: CGFloat = 1) {
        self.layer.borderColor = cor.cgColor
        self.layer.borderWidth = tamanho
    }
    
    func arredondarBordas(comRaio raio: CGFloat = 5){
        self.layer.cornerRadius = raio
    }
}

extension UIView {
    
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
