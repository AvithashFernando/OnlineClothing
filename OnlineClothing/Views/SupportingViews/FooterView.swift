import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack {
            Image("OpenFashion")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Image("Footer")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
