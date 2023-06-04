//
//import SwiftUI
//
//struct ToDoList: View {
//
//  @State private var tasks = [Task]()
//
//  var body: some View {
//    NavigationView {
//      List(tasks) { task in
//        Text(task.title)
//          .strikethrough(task.isCompleted)
//      }
//      .navigationBarTitle("To Do List")
//      .onAppear {
//        // Get the tasks from the API
//        let url = URL(string: "https://api.example.com/tasks")!
//        URLSession.shared.dataTask(with: url) { data, response, error in
//          guard let data = data, error == nil else {
//            return
//          }
//          let tasks = try! JSONDecoder().decode([Task].self, from: data)
//          self.tasks = tasks
//        }.resume()
//      }
//    }
//  }
//}
//
//struct Task: Decodable, Identifiable {
//  let id: Int
//  let title: String
//  let isCompleted: Bool
//}

