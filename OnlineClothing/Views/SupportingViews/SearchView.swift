import SwiftUI

struct SearchView: View {
    @State private var Search: String = ""

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)

                TextField("Search your Style", text: $search)
                    .padding()
            }
            .background(Color(.blue))
            .cornerRadius(12)

            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color(.blue))
                .cornerRadius(12)
        }
            .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}