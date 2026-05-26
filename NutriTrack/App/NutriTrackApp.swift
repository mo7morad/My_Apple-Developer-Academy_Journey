import SwiftUI
import SwiftData

@main
struct NutriTrackApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        // .modelContainer injects the SwiftData container into the entire view hierarchy.
        // Any view that uses @Query or @Environment(\.modelContext) will automatically
        // receive this container — you don't need to pass it down manually.
        .modelContainer(PersistenceController.shared.container)
    }
}
