//
//  Database.swift
//  App
//
//  Created by Michael Holt on 4/12/19.
//

import Foundation

class Database {
    static let shared = Database()

    fileprivate init() {}

    lazy var unitTypeIdentifiers: [String: Unit.Type] = {
        var dict = [String: Unit.Type]()
        for unitType in Dimensions.unitTypes {
            let identifier = "\(unitType)"
            dict[identifier] = unitType
        }
        return dict
    }()

    let unitOptionsIdentifiers: [String: MeasurementFormatter.UnitOptions] = [
        "providedUnit": MeasurementFormatter.UnitOptions.providedUnit,
        "naturalScale": MeasurementFormatter.UnitOptions.naturalScale,
    ]

    let unitStyleIdentifiers: [String: MeasurementFormatter.UnitStyle] = [
        "short": MeasurementFormatter.UnitStyle.short,
        "medium": MeasurementFormatter.UnitStyle.medium,
        "long": MeasurementFormatter.UnitStyle.long,
    ]

    lazy var locales: [LocaleOption] = {
        return Locale.availableIdentifiers.sorted().map { id in
            return LocaleOption(identifier: id, isDefault: id == defaultLocaleIdentifier)
        }
    }()

    let defaultLocaleIdentifier = "en_US_POSIX"

    lazy var dimensionsReference: [DimensionOption] = {
        return Dimensions.all.map { (arg) -> DimensionOption in
            let (type, selectors) = arg
            let baseUnit = MeasurementFormatters.medium.string(from: type.baseUnit())
            let units = selectors.map { "\($0)" }.compactMap(createUnitReference)
            return DimensionOption(identifier: "\(type)", baseUnit: baseUnit, units: units)
        }
    }()

    private func createUnitReference(name: String) -> UnitReference? {
        guard let unit = self.dimensionIdentifiers[name] else { return nil }
        let measurement = Measurement(value: 2, unit: unit)
        return UnitReference(
            identifier: name,
            shortFormat: MeasurementFormatters.short.string(from: measurement),
            mediumFormat: MeasurementFormatters.medium.string(from: measurement),
            longFormat: MeasurementFormatters.long.string(from: measurement)
        )
    }

    lazy var dimensionIdentifiers: [String: Dimension] = {
        var dict = [String: Dimension]()
        for (unitType, selectors) in Dimensions.all {
            for selector in selectors {
                let unitIdentifier = "\(unitType)"
                let name = "\(selector)"
                let fullName = "\(unitIdentifier).\(name)"
                let unit = createUnit(unitType, selector)
                dict[name] = unit
                dict[fullName] = unit
            }
        }
        return dict
    }()

    private func createUnit<T: Dimension>(_ type: T.Type, _ selector: Selector) -> T {
        guard let result = type.perform(selector)?.takeUnretainedValue() as? T else {
            fatalError("Could not create unit type: \(T.self) using selector: \(selector)")
        }
        return result
    }

}
