//
//  hufffffffApp.swift
//  hufffffff
//
//  Created by wahyujus on 16/10/20.
//

import SwiftUI

@main
struct hufffffffApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
