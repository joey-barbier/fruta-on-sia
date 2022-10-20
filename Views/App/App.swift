/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The single entry point for the Fruta app on iOS and macOS.
*/

import SwiftUI
/// - Tag: SingleAppDefinitionTag
///
@main
struct App: SwiftUI.App {
    @StateObject private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
        .commands {
            SidebarCommands()
            SmoothieCommands(model: model)
        }
    }
}
