//
//  CurrencyViewController.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 14/7/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.

import UIKit
import AlertViewLoveNotification

class CurrencyViewController: ViewController,UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    
    let dataSource = CurrencyDataSource()
    
    lazy var viewModel : CurrencyViewModel = {
        let viewModel = CurrencyViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Crtpto List"
        self.tableView.delegate = self
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
        
        self.viewModel.fetchCurrencies()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = dataSource.data.value[indexPath.row]
        self.alertView = AlertViewLoveNotification(imageName: "iconFullPaw", labelTitle: coin.name + " " + coin.symbol, labelDescription: "Do you believe that this coin gonna double in value?", buttonYESTitle: "Yes", buttonNOTitle: "No, sorry..")
        self.alertView.show()
    }

}

