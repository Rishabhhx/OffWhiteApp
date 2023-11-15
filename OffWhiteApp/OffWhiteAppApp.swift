//
//  OffWhiteAppApp.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 07/09/23.
//

import SwiftUI

@main
struct OffWhiteAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
