/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A button for redeeming free smoothies.
 */

import SwiftUI

extension Smoothie {
    struct RedeemButton: View {
        var action: () -> Void
        var height: Double {
#if os(macOS)
            return 30
#else
            return 45
#endif
        }
    }
}

extension Smoothie.RedeemButton {
    var body: some View {
        Button(action: action) {
            Text("Redeem Free Smoothie!", comment: "Button to redeem a free smoothie")
                .font(Font.headline.bold())
                .frame(height: height)
                .frame(minWidth: 100, maxWidth: 400)
                .foregroundStyle(.white)
                .background { Color.accentColor }
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                .contentShape(Rectangle())
        }
        .buttonStyle(.squishable)
    }
}

struct RedeemSmoothieButton_Previews: PreviewProvider {
    static var previews: some View {
        Smoothie.RedeemButton(action: {})
            .frame(width: 300)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
