/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that can display an arbritrary DisplayableMeasurement
*/

import SwiftUI

extension Ingredient.Measured {
    struct Details: View {
        var measurement: DisplayableMeasurement
    }
}

extension Ingredient.Measured.Details {
    var body: some View {
        HStack {
            measurement.unitImage
                .foregroundStyle(.secondary)

            Text(measurement.localizedSummary())
        }
    }
}

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        Ingredient.Measured.Details(
            measurement: Measurement(value: 1.5, unit: UnitVolume.cups)
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
