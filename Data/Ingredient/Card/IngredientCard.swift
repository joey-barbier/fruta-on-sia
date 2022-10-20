/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A card that presents an IngredientGraphic and allows it to flip over to reveal its nutritional information
*/

import SwiftUI

// MARK: - Ingredient View
extension Ingredient {
    struct Card: View {
        var ingredient: Ingredient
        var presenting: Bool
        var closeAction: () -> Void = {}
        @State private var visibleSide = FlipViewSide.front
    }
}

// MARK: - Body
extension Ingredient.Card {
    var body: some View {
        FlipView(visibleSide: visibleSide) {
            Ingredient.Graphic(ingredient: ingredient,
                              style: presenting ? .cardFront : .thumbnail,
                              closeAction: closeAction,
                              flipAction: flipCard)
        } back: {
            Ingredient.Graphic(ingredient: ingredient,
                              style: .cardBack,
                              closeAction: closeAction,
                              flipAction: flipCard)
        }
        .contentShape(Rectangle())
        .animation(.flipCard, value: visibleSide)
    }
}

// MARK: - Method
extension Ingredient.Card {
    func flipCard() {
        visibleSide.toggle()
    }
}
