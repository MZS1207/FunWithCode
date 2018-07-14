//
//  CurrencyDataSource.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 14/7/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class CurrencyDataSource : GenericDataSource<DataStruct>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        if isPrime(indexPath.row) {
            cell.imageStatusOfCurrency.loadImageUsingCache(withUrl: URL_RISE_IMAGE)
        }else {
            cell.imageStatusOfCurrency.loadImageUsingCache(withUrl: URL_DROP_IMAGE)
        }
        
        let currencyRate = self.data.value[indexPath.row]
        cell.currencyRate = currencyRate
        
        return cell
    }
    
    let URL_RISE_IMAGE = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL3zaYLv1Vy89XFwcsAYEeBvPl49TAOi4udm18ZHeTGi95FOPC6Q"
    
    let URL_DROP_IMAGE = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRslkUkG7_m4xFqt4R0iSSs0nQz7JR66cUDPbMTli0N9q3mkznjJg"
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}

