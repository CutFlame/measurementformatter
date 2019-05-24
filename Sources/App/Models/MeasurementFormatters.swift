//
//  MeasurementFormatters.swift
//  App
//
//  Created by Michael Holt on 5/24/19.
//

import Foundation

enum MeasurementFormatters {
    static var naturalScale: MeasurementFormatter = {
        return MeasurementFormatter(unitOptions: .naturalScale, unitStyle: .medium)
    }()
    static var long: MeasurementFormatter = {
        return MeasurementFormatter(unitOptions: .providedUnit, unitStyle: .long)
    }()
    static var medium: MeasurementFormatter = {
        return MeasurementFormatter(unitOptions: .providedUnit, unitStyle: .medium)
    }()
    static var short: MeasurementFormatter = {
        return MeasurementFormatter(unitOptions: .providedUnit, unitStyle: .short)
    }()
}

extension MeasurementFormatter {
    convenience init(
        locale: Locale? = nil,
        unitOptions: MeasurementFormatter.UnitOptions? = nil,
        unitStyle: MeasurementFormatter.UnitStyle? = nil
        ) {
        self.init()
        if let locale = locale { self.locale = locale }
        if let unitOptions = unitOptions { self.unitOptions = unitOptions }
        if let unitStyle = unitStyle { self.unitStyle = unitStyle }
    }
}
