
import SwiftUI

// Using Combine to monitor search field and if user leaves for .5 secs then starts searching
// to avoid memory issue
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .Wearable
    
    // Sample Products
    
    @Published var products: [Product] = [
        
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 8: Red", price: "$399", productImage: "AppleWatch8"),
        
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price: "$180", productImage: "SamsungWatch"),
        
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Ultra", price: "$799", productImage: "AppleWatchUltra"),
        
        Product(type: .Phones, title: "iPhone 14", subtitle: "A15 - Pink", price: "$799", productImage: "iPhone14"),
        
        Product (type: .Phones, title: "iPhone 13", subtitle: "A14 - Blue", price: "$599", productImage: "iPhone13"),
        
        Product (type: .Phones, title: "iPhone 12", subtitle: "A13 - Purple", price: "$599", productImage: "iPhone12"),
        
        Product (type: .Phones, title: "iPhone SE", subtitle: "A13 - White", price: "$429", productImage: "iPhoneSE"),
        
        Product (type: .Laptops, title: "MacBook Air", subtitle: "M1 - Gold", price: "$1199", productImage: "MacBookAir"),
        
        Product (type: .Laptops, title: "MacBook Pro", subtitle: "M2 - Space Grey", price: "$1999", productImage: "MacBookPro"),
        
        Product(type: .Laptops, title: "iMac", subtitle: "M1 - Silver", price: "$1299", productImage: "iMac"),
        
        Product (type: .Tablets, title: "iPad Pro", subtitle: "M2 - Silver\n11-inch display", price: "$799", productImage: "iPadPro"),
        
        Product (type: .Tablets, title: "iPad Air", subtitle: "M1 - Blue", price: "$599", productImage: "iPadAir"),
        
        Product (type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$499", productImage: "iPadMini"),
        
    ]
    
    // Filtered Pr[ducts
    @Published var filteredProducts: [Product] = []
    
    // More products on the type
    @Published var showMoreProductsOnType: Bool = false
    
    // Search Data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    var searchCancellable: AnyCancellable?
    
    init() {
        filterProductByType()
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != "" {
                    self.filterProductBySearch()
                    
                } else {
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterProductByType() {
        
        // Filtering Product By Product Type
        DispatchQueue.global(qos: .userInteractive).async {
            
            let results = self.products
            // Since it will require more memory so were using lazy to perform more
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
            
            // Limiting result
                .prefix(4)
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
    func filterProductBySearch() {
        
        // Filtering Product By Product Type
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
            // Since it will require more memory so were using lazy to perform more
                .lazy
                .filter { product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}

