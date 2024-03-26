//
//  CartItem.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC03 on 2024-03-26.
//

import Foundation

class CartItem {
    var product: Product
    var count: Int = 0

    init(product: Product, count: Int) {
        self.product = product
        self.count = count
    }
}
