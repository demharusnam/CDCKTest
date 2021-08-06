//
//  CDCKTestApp.swift
//  CDCKTest
//
//  Created by Mansur Ahmed on 2021-08-06.
//

import SwiftUI

@main
struct CDCKTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
