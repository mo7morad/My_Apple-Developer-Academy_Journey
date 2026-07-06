//
//  DistilApp.swift
//  Distill
//

import SwiftUI
import SwiftData

@main
struct DistilApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: JournalEntry.self)
    }

}
