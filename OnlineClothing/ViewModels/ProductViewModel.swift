import Foundation

class ProductViewModel: ObservableObject{
    @Published var productResults : [ProductResult] = []

    let urlString = ""

    init() {
        loadProducts()
    }

    func loadProducts() {
        guard let = URL(String: urlString) else {return}

        URLSession(configuration: default).dataTask(with: URLRequest(url: url)){data, response, error in
        
            guard let data = data else {return}

            do{
                let productResponse = try JSONDecoder().decode(ProductDataModel.self, from: data)

                DispatchQueue.main.async{
                    self.productResults = productResponse.result
                }
            } catch {
                print("Unable to decode the data")
            }
        }
        .resume()
    }
}