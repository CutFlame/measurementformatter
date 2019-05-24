//
//  DimensionOption.swift
//  App
//
//  Created by Michael Holt on 5/24/19.
//

import Foundation

struct DimensionOption: Codable {
    let identifier: String
    let baseUnit: String
    let units: [UnitReference]
}
