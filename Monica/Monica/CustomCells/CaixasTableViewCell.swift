//
//  CaixasTableViewCell.swift
//  Monica
//
//  Created by Mariaelena Silveira on 15/10/19.
//  Copyright © 2019 Mariaelena Silveira. All rights reserved.
//

import UIKit

class CaixasTableViewCell: UITableViewCell {

    @IBOutlet weak var caixaCard: UIView!
    @IBOutlet weak var nomeReservatorioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let cor = UIColor(red: 170/255, green: 190/255, blue: 194/255, alpha: 1)
        caixaCard.adicionarBordas(comCor: cor)
        caixaCard.arredondarBordas()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
