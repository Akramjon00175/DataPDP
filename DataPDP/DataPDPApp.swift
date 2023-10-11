
import SwiftUI

@main
struct DataPDPApp: App {
    
    @StateObject private var dataControler = DataController()

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, dataControler.container.viewContext)

        }
    }
}
