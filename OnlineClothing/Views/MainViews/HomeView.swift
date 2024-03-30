import SwiftUI
import Kingfisher

struct HomeView: View {

    @StateObject var productVM : ProductViewModel = ProductDataModel()

    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Header()

                    SearchView()

                    ImageSliderView()

                    HStack {
                        Text("New Arrival")
                            .font(.title)
                            .fontWeight(.medium)

                        Spacer()

                        NavigationLink(description: {
                            ProductsView()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color(.black))
                        })
                    }
                    .padding()

                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10) {
                            ForEach(productList, id: \.id) {product in
                                NavigationLink{
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }

        }
        .environmentObject(cartManager)
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CartManager())
    }
}

struct Header: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName:"location.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)

                    Text("Colombo, SL")
                        .font(.title2)
                        .foregroundColor(.gray)

                    Spacer()

                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                    ) {
                        CartButtonView(numberOfProducts: cartManager.products.count)
                    }
                }
                Text("Choose The")
                        .font(.largeTitle .bold())
                    
                    + Text("Outer Wear")
                        .font(.largeTitle .bold())
                        .foregroundColor(Color(.red))

                    Text("That Suits you")
                        .font(.largeTitle .bold())
            }
        }
        .padding()
        .environmentObject(CartManager())

    }

}

                    