//
//  ErrorResult.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 14/7/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

