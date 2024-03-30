import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0{
                ForEach(cartManager.products, id: \.id) {product in
                    CartItemView(product: product)
                }
                HStack{
                    Text("Your Total is ")
                    Spacer()
                    Text("LKR\(cartManager.total).00")
                        .bold()
                }
                .padding()

                PaymentButton(action: {})
                    .padding()
                    
            } else {
                Text("Your Cart is Empty")
            }
        }
        .NavigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(product: productList[2])
            .environmentObject(CartManager())
    }
}