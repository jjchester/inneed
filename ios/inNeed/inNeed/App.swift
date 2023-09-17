//import SwiftUI
////import RealmSwift
//
//let realmApp = RealmSwift.App(id: "devicesync-bazfp")
//
//@main
//struct realmSwiftUIApp: SwiftUI.App {
//    @StateObject var errorHandler = ErrorHandler(app: realmApp)
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(errorHandler)
//                .alert(Text("Error"), isPresented: .constant(errorHandler.error != nil)) {
//                    Button("OK", role: .cancel) { errorHandler.error = nil }
//                } message: {
//                    Text(errorHandler.error?.localizedDescription ?? "")
//                }
//        }
//    }
//}
//
//final class ErrorHandler: ObservableObject {
//    @Published var error: Swift.Error?
//
//    init(app: RealmSwift.App) {
//        // Sync Manager listens for sync errors.
//        app.syncManager.errorHandler = { syncError, syncSession in
//            self.error = syncError
//        }
//    }
//}
