/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A button that unlocks all recipes.
*/

import SwiftUI
import StoreKit

extension Smoothie.Recipe {
    struct UnlockButton: View {
        var product: Product
        var purchaseAction: () -> Void
        
        @Environment(\.colorScheme) private var colorScheme
    }
}

extension Smoothie.Recipe.UnlockButton {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("smoothie/recipes-background").resizable()
                .aspectRatio(contentMode: .fill)
                #if os(iOS)
                .frame(height: 225)
                #else
                .frame(height: 150)
                #endif
                .accessibility(hidden: true)
            
            bottomBar
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .strokeBorder(.quaternary, lineWidth: 0.5)
        }
        .accessibilityElement(children: .contain)
    }
    
    var bottomBar: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .bold()
                Text(product.description)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if case let .available(displayPrice) = product.availability {
                Button(action: purchaseAction) {
                    Text(displayPrice)
                }
                .buttonStyle(.purchase)
                .accessibility(label: Text("Buy recipe for \(displayPrice)",
                                           comment: "Accessibility label for button to buy recipe for a certain price."))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .accessibilityElement(children: .combine)
    }
}

extension Smoothie.Recipe.UnlockButton {
    struct Product {
        var title: LocalizedStringKey
        var description: LocalizedStringKey
        var availability: Availability
    }
    
    enum Availability {
        case available(displayPrice: String)
        case unavailable
    }
}

extension Smoothie.Recipe.UnlockButton.Product {
    init(for product: StoreKit.Product) {
        title = LocalizedStringKey(product.displayName)
        description = LocalizedStringKey(product.description)
        availability = .available(displayPrice: product.displayPrice)
    }
}

// MARK: - Previews
struct RecipeUnlockButton_Previews: PreviewProvider {
    static let availableProduct = Smoothie.Recipe.UnlockButton.Product(
        title: "Unlock All Recipes",
        description: "Make smoothies at home!",
        availability: .available(displayPrice: "$4.99")
    )
    
    static let unavailableProduct = Smoothie.Recipe.UnlockButton.Product(
        title: "Unlock All Recipes",
        description: "Loading…",
        availability: .unavailable
    )
    
    static var previews: some View {
        Group {
            Smoothie.Recipe.UnlockButton(product: availableProduct,
                                         purchaseAction: {})
            Smoothie.Recipe.UnlockButton(product: unavailableProduct,
                                         purchaseAction: {})
        }
        .frame(width: 300)
        .previewLayout(.sizeThatFits)
    }
}
