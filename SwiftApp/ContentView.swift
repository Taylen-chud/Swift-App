import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var Count: Int = 0
    @Query private var tasks: [task]
    @environment(\.modelContext) private var modelContext
    @State private var newTaskTitle = ""
    var body: some View {
        VStack {
        
        Text("Task Tracker")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom)

        HStack {
            TextField(" New Task", text: $newTaskTitle)
                .textFieldStyle(.roundedBorder)
            Button("Add") {
                addTask()
            }
            .buttonStyle(.borderProminent)
            .disabled(newTaskTitle.isEmpty)
        }

            // list of tasks
            List {
                ForEach(tasks) { task in 
                HStack {
                    Text(task.title)
                        .strikthrough(task.isCompleted)
                    Image(systemName: task.isCompleted ? "checkmark.seal.fill" 
                       : "circlebadge") 
                }
                .onTapGesture {
                    toggleTask(task)
                }
                
                }
                .onDelete(perform: deleteTask)
            }


        }
        .padding()
    }
    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        modelContext.insert(newTask)
        newTaskTitle = ""
    }
    private func toggleTask(_ task: Task) {
       task.isCompleted.toggle()
    }

    private func deleteTask(at offsets: IndexSet){
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }
}

#preview {
    ContentView()
}