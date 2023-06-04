
import SwiftUI

struct TodoItem: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct TodoItemViewModel_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem()
    }
}


struct TodoItemViewModel: Identifiable {
private let todo: Todo
init (todo: Todo) {
self.todo = todo
}
    
var id: Int {
todo.id
}
    
var title: String {
todo.title
}
    
var priority: String {
    todo.priority.uppercased()
    
}
}
