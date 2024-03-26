//
//  ProductItemView.swift
//  OnlineClothing
//
//  Created by NIBM-LAB04-PC03 on 2024-03-26.
//

import SwiftUI

struct ProductItemView: View {
    var product: Product

    var body: some View {
      
            Button {

            } label: {
                VStack {
                Image(product.images[0]) // array in Constants
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 165, height: 200)
                .cornerRadius(5)
                .shadow(radius: 1)

            Text(product.title)
                .font(Font.custom("Tenor Sans", size: 12))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.BodyGrey)
                .frame(width: 165, alignment: .leading)
            
            Text("$\(product.price)")
                .font(Font.custom("Tenor Sans", size: 16))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.Default)
                .frame(width: 165, alignment: .leading)
                .padding(.top, 2)
            }
            
        }

    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: product1)
    }
}
