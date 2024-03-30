import SwiftUI

struct ProductDetailsView: View {

    @State private var selectedSize: String?
    let sizes = ["S", "M", "L", "XL"]

    var product: Product
    var body: some View {
        ScrollView {
            ZStack {
                Color.white

                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 63)
                            .padding(.trailing, 20)
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.title)
                                .font(.title2 .bold())

                            Spacer()

                            Text("LKR\(product.price).00")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .background(Color(.red))
                                .cornerRadius(12)

                        }
                        .padding(.vertical)

                        HStack {
                            HStack(spacing: 10) {
                                ForEach(0..<5) {index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20,height: 20)
                                        .foregroundColor(.yellow)
                                }
                                Text("(4.5)")
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical)

                            Spacer()

                            HStack {
                                Button(action: {}, label: {
                                    Image(systemName: "minus.square")
                                })
                                Text("1")
                                Button(action: {}, label: {
                                    Image(systemName: "minus.square")
                                        .foregroundColor(Color(.gray))
                                })
                            }
                        }

                        Text("Description")
                            .font(.title3)
                            .fontWeight(.medium)

                        Text(product.description)
                        Spacer()
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Size")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)

                                ForEach(sizes, id: \.self) { size in
                                    Button(action: {
                                        if selectedSize == size {
                                            // Deselect the size if already selected
                                            selectedSize = nil
                                    } else {
                                            selectedSize = size
                                    }
                                }) {
                                    Text(size)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(selectedSize == size ? Color.blue : Color.gray)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(selectedSize == size ? Color.blue : Color.clear, lineWidth: 2)
                                        )
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            Spacer()

                            VStack(alignment: .trailing) {
                                Text("Colors")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)

                                    HStack{
                                        ColorDotView(color: .blue)
                                        ColorDotView(color: .black)
                                        ColorDotView(color: .gray)
                                    }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)

                        }
                        .padding(.vertical)

                        PaymentButton(action: {})
                            .frame(width: .infinity, height: 35)

                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)

                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[4])
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle)
    }
}
