/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A button to favorite a smoothie, can be placed in a toolbar.
*/

import SwiftUI

extension Smoothie.Favorite {
    struct Button: View {
        @EnvironmentObject private var model: Model
        
        var isFavorite: Bool {
            guard let smoothieID = model.selectedSmoothieID else { return false }
            return model.favoriteSmoothieIDs.contains(smoothieID)
        }
    }
}

// MARK: - Body
extension Smoothie.Favorite.Button {
    var body: some View {
        Button(action: toggleFavorite) {
            if isFavorite {
                Label {
                    Text("Remove from Favorites", comment: "Toolbar button/menu item to remove a smoothie from favorites")
                } icon: {
                    Image(systemName: "heart.fill")
                }
            } else {
                Label {
                    Text("Add to Favorites", comment: "Toolbar button/menu item to add a smoothie to favorites")
                } icon: {
                    Image(systemName: "heart")
                }

            }
        }
        .disabled(model.selectedSmoothieID == nil)
    }
    
    func toggleFavorite() {
        guard let smoothieID = model.selectedSmoothieID else { return }
        model.toggleFavorite(smoothieID: smoothieID)
    }
}

struct SmoothieFavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        Smoothie.Favorite.Button()
            .padding()
            .previewLayout(.sizeThatFits)
            .environmentObject(Model())
    }
}
