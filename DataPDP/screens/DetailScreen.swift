import SwiftUI
import CoreData

struct DetailScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var gender: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var address: String = ""
    let genders = ["Male", "Female"]
    
    func saveTask(firstName:String, lastName:String, gender:String, phone:String, email:String, address:String){
        let task = Task(context: self.moc)
        task.id = UUID()
        task.firstName = firstName
        task.lastName = lastName
        task.phone = phone
        task.email = email
        task.address = address
        
        try? self.moc.save()
    }
    
    var body: some View {
        
        NavigationView{
            
            Form{
                Section{
                    TextField("FirstName", text: $firstName)
                    TextField("LastName", text: $lastName)
                    Picker("Gender", selection: $gender){
                        ForEach(genders, id:\.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                    
                }
                
            }
            .navigationBarTitle("Task List", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                saveTask(firstName: firstName, lastName: lastName, gender: gender, phone: phone, email: email, address: address)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            }))
        }
        
        
        
    }
}

#Preview {
    DetailScreen()
}
