/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The primary entry point for the app's user interface. Can change between tab-based and sidebar-based navigation.
*/

import SwiftUI

extension App {
    struct ContentView: View {
#if os(iOS)
        @Environment(\.horizontalSizeClass) private var horizontalSizeClass
#endif
        
        var body: some View {
#if os(iOS)
            if horizontalSizeClass == .compact {
                App.TabNavigation()
            } else {
                App.SidebarNavigation()
            }
#else
            AppSidebarNavigation()
#endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        App.ContentView()
    }
}
