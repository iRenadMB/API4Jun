//import Foundation
//import SwiftUI
//
//struct ApiKey {
//    let key: String
//
//    init(key: String) {
//        self.key = key
//    }
//
//    func get(url: URL) -> Data? {
//        var request = URLRequest(url: url)
//        request.addValue(key, forHTTPHeaderField: "API-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                return data
//            } else {
//                return nil
//            }
//        }
//
//        task.resume()
//
//        return task.data
//    }
//}
//
//struct GetMethodAPI: View {
//    @State private var apiKey: String = ""
//
//    var body: some View {
//        TextField("API Key", text: $apiKey)
//            .padding()
//            .border(Color.gray)
//
//        Button(action: {
//            let apiKey = ApiKey(key: self.apiKey)
//            let url = URL(string: "https://api.example.com/")!
//
//            let data = apiKey.get(url: url)
//
//            if let data = data {
//                let decodedData = try! JSONDecoder().decode([String: Any].self, from: data)
//
//                print(decodedData)
//            } else {
//                print("Error getting data from API")
//            }
//        }) {
//            Text("Get Data")
//        }
//    }
//}
