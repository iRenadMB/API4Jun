//import SwiftUI
//
//struct APIKeyGetView: View {
//    @State private var apiKey: String = ""
//    @State private var data: Data?
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("API Key", text: $apiKey)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Button(action: {
//                    // Make a GET request to the API.
//                    let url = URL(string: "https://api.github.com/search/users?q=&page=&per_page=10")!
//                    var request = URLRequest(url: url)
//                    request.addValue(apiKey, forHTTPHeaderField: "API-Key")
//                    let session = URLSession.shared
//                    let task = session.dataTask(with: request) { data, response, error in
//                        if let data = data {
//                            self.data = data
//                        }
//                    }
//                    task.resume()
//                }) {
//                    Text("Get Data")
//                }
//                if let data = data {
//                    // Decode the JSON response.
//                    let response = try! JSONDecoder().decode(Response.self, from: data)
////                    print(response)
//                }
//            }
//        }
//    }
//}
//
//struct Response: Decodable {
//    let data: [String]
//}
