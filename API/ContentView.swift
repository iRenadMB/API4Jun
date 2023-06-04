//
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var todoListVM = TodoListViewModel()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach (todoListVM.todoItems) { todoItem in
//                        HStack {
//                            Text (todoItem.title)
//                            Spacer()
//                            Text (todoItem.priority)
//                        }
//                    }
//                }.onDelete{ indexSet in
//                }
//                }.onAppear(perform: {
//                    todoListVM.populateTodos()
//                })
//                .navigationTitle("Todos")
//
//            }
//        }
//    }
//
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }
//}
//
//// https://warp-wiry-rugby.glitch.me/todos
