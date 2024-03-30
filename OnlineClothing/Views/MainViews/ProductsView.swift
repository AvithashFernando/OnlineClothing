//
//  SideMenuView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC03 on 2024-03-26.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var cartManager: CartManager

    var column = [GridItem(.adoptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productList, id: \.id) {product in
                        ProductCardView(product: product)
                    }
                }
                .padding()
            }
            .NavigationTitle(Text("All New Arrival"))
        }
    }
}

struct ProductView_Preview: PreviewProvider {
    static var previews: some View {
        ProductView()
            .environmentObject(CartManager())
    }
}
