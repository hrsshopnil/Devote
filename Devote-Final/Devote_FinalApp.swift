//
//  Devote_FinalApp.swift
//  Devote-Final
//
//  Created by shopnil hasan on 9/6/24.
//

import SwiftUI
import SwiftData

@main
struct Devote_FinalApp: App {
    
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkModeOn ? .dark : .light)
        }
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([Tasks.self])
        let config = ModelConfiguration("MyBooks", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }

        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
