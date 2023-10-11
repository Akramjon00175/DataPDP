import SwiftUI

struct HomeScreen: View {
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var tasks: FetchedResults<Task>
    @State var isModel = false
    
    var body: some View {
        NavigationView{
            
            List{
                ForEach(tasks, id: \.id){ task in
                    TaskCell(task: task)
                }
            }
            
            .navigationBarItems(trailing:
                                    Button(action: {
                self.isModel = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModel, content: {
                DetailScreen()
            }))
            .listStyle(PlainListStyle())
            .navigationBarTitle("Task List", displayMode: .inline)
            
        }
    }
}

#Preview {
    HomeScreen()
}
