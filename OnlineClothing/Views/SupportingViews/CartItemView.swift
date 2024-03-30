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

                HStack(spacing: 20) {
                    Button {
                        item.count += 1
                        //onCartCountValueChanged()
                    } label: {
                        Circle()
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .tint(.black)
                                    .frame(width: 14, height: 14)
                            }
                    }
                    .frame(width: 24, height: 24)

                    Text("\(item.count)")
                        .font(tenorSans(24))
                        .foregroundColor(.black)

                        Button {
                            item.count -= 1
                            if item.count < 0 {
                                item.count = 0
                            }

                            // onCartCountValueChanged()
                        } label: {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                                .overlay {
                                    Image(systemName: "minus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .tint(.black)
                                        .frame(width: 14, height: 14)
                                }
                        }
                        .frame(width: 24, height: 24)

                        Spacer()
                    }

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