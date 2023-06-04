
import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    // Shared Data Model
    //    @EnvironmentObject var sharedData: SharedDataModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
        
        // Sample Product for Building Preview
        ProductDetailView(product: HomeViewModel().products[0])
        //        .environmentObject(SharedDataModel())
        
    }
}
