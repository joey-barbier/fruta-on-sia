//
//  IngredientRow.swift
//  Fruta
//
//  Created by Joey BARBIER on 20/10/2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

extension Ingredient {
    struct Row: View {
        var measuredIngredient: Ingredient.Measured
        @State private var checked = false
    }
}

extension Ingredient.Row {
    var body: some View {
        Button(action: { checked.toggle() }) {
            HStack {
                measuredIngredient.ingredient.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(measuredIngredient.ingredient.thumbnailCrop.scale * 1.25)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(measuredIngredient.ingredient.name).font(.headline)
                    Ingredient.Measured.Details(measurement: measuredIngredient.measurement)
                }
                
                Spacer()
                
                Toggle(isOn: $checked) {
                    Text("Complete",
                         comment: "Label for toggle showing whether you have completed adding an ingredient that's part of a smoothie recipe")
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .toggleStyle(.circle)
    }
}
