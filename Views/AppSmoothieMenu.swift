/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The menu tab or content list that includes all smoothies.
*/

import SwiftUI

extension App {
    struct SmoothieMenu: View {
        var body: some View {
            Smoothie.List(smoothies: Smoothie.all())
                .navigationTitle(Text("Menu",
                                      comment: "Title of the 'menu' app section showing the menu of available smoothies"))
        }
    }
}

struct SmoothieMenu_Previews: PreviewProvider {
    static var previews: some View {
        App.SmoothieMenu()
            .environmentObject(Model())
    }
}
