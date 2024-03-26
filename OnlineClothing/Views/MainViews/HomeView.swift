import SwiftUI

struct HomeView: View {

    @State var presentSideMenu = false
    @State var presentSideCart = false

    private var categories = [Categories.All.rawValue, Categories.Apparel.rawValue,
        Categories.Dress.rawValue, Categories.TShirt.rawValue]

    @State private var selectedCategory: Int = 0

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0){
                    ScrollView(.vertical){
                        HeroImageView()
                        NewArrivalView()
                        Image("Brand")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        CollectionsView()
                        FooterView()
                        TrendingHashTagsView()
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top, 56)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    presentSideMenu.toggle()
                } cartAction : {
                    presentSideCart.toggle()
                }
            }

            SideMenu()
            SideCart()
        }
    }

    @ViewBuilder
    private func HeroImageView() -> some View {
        ZStack {
            Image("Hero")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 620)

            Button{
                print("Explore Collection Button clicked")

            } label: {
                RoundedRectangle(cornerRadius: 30).overlay {
                    Text("Explore Collection")
                        .font(Font.custom("Tenor Sans", size: 20))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 253, height: 40)
            .tint(.black.opacity(0.4))
            .offset(.init(width: 0, height: 250))
        }

    }

    @ViewBuilder
    private func NewArrivalView() -> some View {
        Text("New Arrival")
            .font(Font.custom("Tenor Sans", size: 28))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .frame(width: 225, height: 32, alignment: .top)
            .padding(.top, 25)

        Image("Divider")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 140)
            .padding(.top, 10)

        VStack {
            HStack(spacing: 20) {
                ForEach(0..<categories.count, id: \.self) { i in
                    CategoryView(isSelected: i == selectedCategory, title:
                        categories[i])
                        .onTapGesture {
                            selectedCategory = i
                        }

                }
            }
            .frame(maxWidth: .infinity)

            HStack {
                    ProductItemView(product: product1)
                    ProductItemView(product: product2)
            }
            HStack {
                    ProductItemView(product: product3)
                    ProductItemView(product: product4)
            }

            Button {

            } label: {
                HStack(alignment: .center, spacing: 8) {
                    Text("Explore More")
                        .font(tenorSans(20))
                        .multilineTextAlignment(.center)

                    Image(systemName: "arrow.forward")
                        .frame(width: 18, height: 18)
                }
            }
            .tint(Color.BodyGrey)
            .padding(12)

        }
    }

    @ViewBuilder
    private func CollectionsView() -> some View {
        Text("Collection")
            .font(tenorSans(28))
            .foregroundColor(Color.black)
        
        Image("Collection 1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 244, alignment: .top)
            .clipped()

        Image("Collection 2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 244, alignment: .top)
            .clipped()

        Image("Divider")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 140)
            .padding(.top, 10)

    }

    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content:
            AnyView(SideMenuViewContents(presentSideMenu:
            $presentSideMenu)), direction: .leading)
    }

    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content:
            AnyView(SideCartViewContents(presentSideMenu:
            $presentSideCart)), direction: .trailing)
        
    }

}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

