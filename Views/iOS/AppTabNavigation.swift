/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Tab based app structure.
*/

import SwiftUI

extension App {
    struct TabNavigation: View {
        
        enum Tab {
            case menu
            case favorites
            case rewards
            case recipes
        }
        
        @State private var selection: Tab = .menu
    }
}

// MARK: - Body
extension App.TabNavigation {
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                App.SmoothieMenu()
            }
            .tabItem {
                let menuText = Text("Menu", comment: "Smoothie menu tab title")
                Label {
                    menuText
                } icon: {
                    Image(systemName: "list.bullet")
                }.accessibility(label: menuText)
            }
            .tag(Tab.menu)
            
            NavigationView {
                App.FavoriteSmoothies()
            }
            .tabItem {
                Label {
                    Text("Favorites",
                         comment: "Favorite smoothies tab title")
                } icon: {
                    Image(systemName: "heart.fill")
                }
            }
            .tag(Tab.favorites)
            
            #if EXTENDED_ALL
            NavigationView {
                Order.View()
            }
            .tabItem {
                Label {
                    Text("Rewards",
                         comment: "Smoothie rewards tab title")
                } icon: {
                    Image(systemName: "seal.fill")
                }
            }
            .tag(Tab.rewards)
            
            NavigationView {
                Smoothie.Recipe.List()
            }
            .tabItem {
                Label {
                    Text("Recipes",
                         comment: "Smoothie recipes tab title")
                } icon: {
                    Image(systemName: "book.closed.fill")
                }
            }
            .tag(Tab.recipes)
            #endif
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        App.TabNavigation()
    }
}
