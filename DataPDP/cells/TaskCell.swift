
import SwiftUI

struct TaskCell: View {
    
    var task: Task
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                // Name
                HStack{
                    //Text(task.firstName!).fontWeight(.black).padding(.trailing,3)
                    //Text(task.lastName!).fontWeight(.black)
                }.padding(7)
                // Phone and Email
                HStack{
                    Text(task.phone ?? "")
                    Text(" | ")
                    Text(task.email ?? "")
                }.padding(7)
                
                Text(task.address ?? "").padding(7)
            }
            Spacer()
            
            VStack{
                Text(task.gander ?? "")
                    .padding(10)
                    .foregroundColor(Color.red)
            }
        }.padding(.top,10).padding(.bottom,10)
        
    }
}

