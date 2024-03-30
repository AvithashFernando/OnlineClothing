import SwiftUI

struct CartItemView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        HStack(spacing: 20) {
            image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)

            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .bold()
                
                Text("LKR \(product.price)")
                    .bold()
                }
                .padding()

                Spacer()

                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .onTapGesture {
                        cartManager.removeFromCart(product: product)
                    }
            }
            .padding(.horizontal)
            .background(Color(.lightblue))
            .cornerRadius(12)
            .frame(width: .infinity, alignment: leading)
            .padding()
        }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(product: productList[2])
            .environmentObject(CartManager())
    }
}