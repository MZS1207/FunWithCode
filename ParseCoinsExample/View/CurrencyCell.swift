//
//  CurrencyCell.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 14/7/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.
//

import UIKit
class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencySymbol: UILabel!
    @IBOutlet weak var imageStatusOfCurrency: UIImageView!
    
    
    var currencyRate : DataStruct? {
        didSet {
            
            guard let currencyRate = currencyRate else {
                return
            }
            
            if let _symbol = currencyRate.symbol {
                currencySymbol.text = _symbol
            }
            
            if let _currencyName = currencyRate.name {
                currencyName.text = _currencyName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
