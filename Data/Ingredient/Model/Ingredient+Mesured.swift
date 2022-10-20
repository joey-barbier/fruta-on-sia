//
//  Ingredient+Mesured.swift
//  Fruta
//
//  Created by Joey BARBIER on 20/10/2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation

extension Ingredient {
    func measured(with unit: UnitVolume) -> Ingredient.Measured {
        Ingredient.Measured(self, measurement: Measurement(value: 1, unit: unit))
    }
}
