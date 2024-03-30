import SwiftUI

struct CartButtonView: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag.fill")
                .foregroundColor(.black)
                .padding(5)
            if numberOfProducts > 0 {
                    Text("\(numberOfProducts)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15)
                        .background(.red)
                        .cornerRadius(50)
            }
        }
    }
}

struct CartButtonView_Preview: PreviewProvider {
    static var previews: some View {
        CartButtonView()
            .environmentObject(CartManager())
    }
}