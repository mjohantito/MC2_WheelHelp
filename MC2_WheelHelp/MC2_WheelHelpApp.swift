//
//  MC2_WheelHelpApp.swift
//  MC2_WheelHelp
//
//  Created by Manuel Johan Tito on 16/06/23.
//

import SwiftUI

@main
struct MC2_WheelHelpApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
//            ButtonGenerateDataView()
            PlaceView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(authManager)
        }
    }
}
