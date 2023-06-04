//
//import SwiftUI
//
//struct APIMethods: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}
//
//struct APIMethods_Previews: PreviewProvider {
//    static var previews: some View {
//        APIMethods()
//    }
//}
//
//struct APIKey {
//    let get: () -> Void
//    let post: (_ data: Data) -> Void
//    let delete: (_ id: Int) -> Void
//    
//}
//
//extension APIKey {
//    static let shared = APIKey(
//        get: {
//            // Get data from the API
//        },
//        post: { data in
//            // Post data to the API
//        },
//        delete: { id in
//            // Delete data from the API
//        }
//    )
//}
