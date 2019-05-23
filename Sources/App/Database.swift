//
//  Database.swift
//  App
//
//  Created by Michael Holt on 4/12/19.
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

struct LocaleOption: Codable {
    let identifier: String
    let isDefault: Bool
}

struct UnitReference: Codable {
    let identifier: String
    let shortFormat: String
    let mediumFormat: String
    let longFormat: String
}

struct DimensionOption: Codable {
    let identifier: String
    let baseUnit: String
    let units: [UnitReference]
}


class Database {
    static let shared = Database()

    fileprivate init() {}

    let unitTypes:[Unit.Type] = [
        UnitAcceleration.self,
        UnitAngle.self,
        UnitArea.self,
        UnitConcentrationMass.self,
        UnitDispersion.self,
        UnitDuration.self,
        UnitElectricCharge.self,
        UnitElectricCurrent.self,
        UnitElectricPotentialDifference.self,
        UnitElectricResistance.self,
        UnitEnergy.self,
        UnitFrequency.self,
        UnitFuelEfficiency.self,
        UnitIlluminance.self,
        UnitLength.self,
        UnitMass.self,
        UnitPower.self,
        UnitPressure.self,
        UnitSpeed.self,
        UnitTemperature.self,
        UnitVolume.self,
    ]

    lazy var unitTypeIdentifiers:[String: Unit.Type] = {
        var dict = [String:Unit.Type]()
        for unitType in self.unitTypes {
            let identifier = "\(unitType)"
            dict[identifier] = unitType
        }
        return dict
    }()

    lazy var dimensionIdentifiers:[String: Dimension] = {
        var dict = [String: Dimension]()
        for (unitType, selectors) in self.all {
            for selector in selectors {
                let unitIdentifier = "\(unitType)"
                let name = "\(selector)"
                let fullName = "\(unitIdentifier).\(name)"
                let unit = Database.createUnit(unitType, selector)
                dict[name] = unit
                dict[fullName] = unit
            }
        }
        return dict
    }()

    let unitOptions = [
        MeasurementFormatter.UnitOptions.providedUnit,
        MeasurementFormatter.UnitOptions.naturalScale,
    ]

    let unitStyles = [
        MeasurementFormatter.UnitStyle.short,
        MeasurementFormatter.UnitStyle.medium,
        MeasurementFormatter.UnitStyle.long,
    ]

    let unitOptionsIdentifiers:[String:MeasurementFormatter.UnitOptions] = [
        "providedUnit": MeasurementFormatter.UnitOptions.providedUnit,
        "naturalScale": MeasurementFormatter.UnitOptions.naturalScale,
    ]

    let unitStyleIdentifiers:[String:MeasurementFormatter.UnitStyle] = [
        "short": MeasurementFormatter.UnitStyle.short,
        "medium": MeasurementFormatter.UnitStyle.medium,
        "long": MeasurementFormatter.UnitStyle.long,
    ]

    let accelerations = [
        #selector(getter: UnitAcceleration.gravity),
        #selector(getter: UnitAcceleration.metersPerSecondSquared),
    ]
    let angles = [
        #selector(getter: UnitAngle.arcMinutes),
        #selector(getter: UnitAngle.arcSeconds),
        #selector(getter: UnitAngle.degrees),
        #selector(getter: UnitAngle.gradians),
        #selector(getter: UnitAngle.radians),
        #selector(getter: UnitAngle.revolutions),
    ]
    let areas = [
        #selector(getter: UnitArea.acres),
        #selector(getter: UnitArea.ares),
        #selector(getter: UnitArea.hectares),
        #selector(getter: UnitArea.squareCentimeters),
        #selector(getter: UnitArea.squareFeet),
        #selector(getter: UnitArea.squareInches),
        #selector(getter: UnitArea.squareKilometers),
        #selector(getter: UnitArea.squareMegameters),
        #selector(getter: UnitArea.squareMeters),
        #selector(getter: UnitArea.squareMicrometers),
        #selector(getter: UnitArea.squareMiles),
        #selector(getter: UnitArea.squareMillimeters),
        #selector(getter: UnitArea.squareNanometers),
        #selector(getter: UnitArea.squareYards),
    ]
    let concentrationMasses = [
        #selector(getter: UnitConcentrationMass.gramsPerLiter),
        #selector(getter: UnitConcentrationMass.milligramsPerDeciliter),
    ]
    let dispersions = [
        #selector(getter: UnitDispersion.partsPerMillion),
    ]
    let durations = [
        #selector(getter: UnitDuration.hours),
        #selector(getter: UnitDuration.minutes),
        #selector(getter: UnitDuration.seconds),
    ]
    let electricCharges = [
        #selector(getter: UnitElectricCharge.ampereHours),
        #selector(getter: UnitElectricCharge.coulombs),
        #selector(getter: UnitElectricCharge.kiloampereHours),
        #selector(getter: UnitElectricCharge.megaampereHours),
        #selector(getter: UnitElectricCharge.microampereHours),
        #selector(getter: UnitElectricCharge.milliampereHours),
    ]
    let electricCurrents = [
        #selector(getter: UnitElectricCurrent.amperes),
        #selector(getter: UnitElectricCurrent.kiloamperes),
        #selector(getter: UnitElectricCurrent.megaamperes),
        #selector(getter: UnitElectricCurrent.microamperes),
        #selector(getter: UnitElectricCurrent.milliamperes),
    ]
    let electricPotentialDifferences = [
        #selector(getter: UnitElectricPotentialDifference.kilovolts),
        #selector(getter: UnitElectricPotentialDifference.megavolts),
        #selector(getter: UnitElectricPotentialDifference.microvolts),
        #selector(getter: UnitElectricPotentialDifference.millivolts),
        #selector(getter: UnitElectricPotentialDifference.volts),
    ]
    let electricResistances = [
        #selector(getter: UnitElectricResistance.kiloohms),
        #selector(getter: UnitElectricResistance.megaohms),
        #selector(getter: UnitElectricResistance.microohms),
        #selector(getter: UnitElectricResistance.milliohms),
        #selector(getter: UnitElectricResistance.ohms),
    ]
    let energies = [
        #selector(getter: UnitEnergy.calories),
        #selector(getter: UnitEnergy.joules),
        #selector(getter: UnitEnergy.kilocalories),
        #selector(getter: UnitEnergy.kilojoules),
        #selector(getter: UnitEnergy.kilowattHours),
    ]
    let frequencies = [
        #selector(getter: UnitFrequency.gigahertz),
        #selector(getter: UnitFrequency.hertz),
        #selector(getter: UnitFrequency.kilohertz),
        #selector(getter: UnitFrequency.megahertz),
        #selector(getter: UnitFrequency.microhertz),
        #selector(getter: UnitFrequency.millihertz),
        #selector(getter: UnitFrequency.nanohertz),
        #selector(getter: UnitFrequency.terahertz),
    ]
    let fuelEfficiencies = [
        #selector(getter: UnitFuelEfficiency.litersPer100Kilometers),
        #selector(getter: UnitFuelEfficiency.milesPerGallon),
        #selector(getter: UnitFuelEfficiency.milesPerImperialGallon),
    ]
    let illuminances = [
        #selector(getter: UnitIlluminance.lux),
    ]
    let lengths = [
        #selector(getter: UnitLength.astronomicalUnits),
        #selector(getter: UnitLength.centimeters),
        #selector(getter: UnitLength.decameters),
        #selector(getter: UnitLength.decimeters),
        #selector(getter: UnitLength.fathoms),
        #selector(getter: UnitLength.feet),
        #selector(getter: UnitLength.furlongs),
        #selector(getter: UnitLength.hectometers),
        #selector(getter: UnitLength.inches),
        #selector(getter: UnitLength.kilometers),
        #selector(getter: UnitLength.lightyears),
        #selector(getter: UnitLength.megameters),
        #selector(getter: UnitLength.meters),
        #selector(getter: UnitLength.micrometers),
        #selector(getter: UnitLength.miles),
        #selector(getter: UnitLength.millimeters),
        #selector(getter: UnitLength.nanometers),
        #selector(getter: UnitLength.nauticalMiles),
        #selector(getter: UnitLength.parsecs),
        #selector(getter: UnitLength.picometers),
        #selector(getter: UnitLength.scandinavianMiles),
        #selector(getter: UnitLength.yards),
    ]
    let masses = [
        #selector(getter: UnitMass.carats),
        #selector(getter: UnitMass.centigrams),
        #selector(getter: UnitMass.decigrams),
        #selector(getter: UnitMass.grams),
        #selector(getter: UnitMass.kilograms),
        #selector(getter: UnitMass.metricTons),
        #selector(getter: UnitMass.micrograms),
        #selector(getter: UnitMass.milligrams),
        #selector(getter: UnitMass.nanograms),
        #selector(getter: UnitMass.ounces),
        #selector(getter: UnitMass.ouncesTroy),
        #selector(getter: UnitMass.picograms),
        #selector(getter: UnitMass.pounds),
        #selector(getter: UnitMass.shortTons),
        #selector(getter: UnitMass.slugs),
        #selector(getter: UnitMass.stones),
    ]
    let powers = [
        #selector(getter: UnitPower.femtowatts),
        #selector(getter: UnitPower.gigawatts),
        #selector(getter: UnitPower.horsepower),
        #selector(getter: UnitPower.kilowatts),
        #selector(getter: UnitPower.megawatts),
        #selector(getter: UnitPower.microwatts),
        #selector(getter: UnitPower.milliwatts),
        #selector(getter: UnitPower.nanowatts),
        #selector(getter: UnitPower.picowatts),
        #selector(getter: UnitPower.terawatts),
        #selector(getter: UnitPower.watts),
    ]
    let pressures = [
        #selector(getter: UnitPressure.bars),
        #selector(getter: UnitPressure.gigapascals),
        #selector(getter: UnitPressure.hectopascals),
        #selector(getter: UnitPressure.inchesOfMercury),
        #selector(getter: UnitPressure.kilopascals),
        #selector(getter: UnitPressure.megapascals),
        #selector(getter: UnitPressure.millibars),
        #selector(getter: UnitPressure.millimetersOfMercury),
        #selector(getter: UnitPressure.newtonsPerMetersSquared),
        #selector(getter: UnitPressure.poundsForcePerSquareInch),
    ]
    let speeds = [
        #selector(getter: UnitSpeed.kilometersPerHour),
        #selector(getter: UnitSpeed.knots),
        #selector(getter: UnitSpeed.metersPerSecond),
        #selector(getter: UnitSpeed.milesPerHour),
    ]
    let tempuratures = [
        #selector(getter: UnitTemperature.celsius),
        #selector(getter: UnitTemperature.fahrenheit),
        #selector(getter: UnitTemperature.kelvin),
    ]
    let volumes = [
        #selector(getter: UnitVolume.acreFeet),
        #selector(getter: UnitVolume.bushels),
        #selector(getter: UnitVolume.centiliters),
        #selector(getter: UnitVolume.cubicCentimeters),
        #selector(getter: UnitVolume.cubicDecimeters),
        #selector(getter: UnitVolume.cubicFeet),
        #selector(getter: UnitVolume.cubicInches),
        #selector(getter: UnitVolume.cubicKilometers),
        #selector(getter: UnitVolume.cubicMeters),
        #selector(getter: UnitVolume.cubicMiles),
        #selector(getter: UnitVolume.cubicMillimeters),
        #selector(getter: UnitVolume.cubicYards),
        #selector(getter: UnitVolume.cups),
        #selector(getter: UnitVolume.deciliters),
        #selector(getter: UnitVolume.fluidOunces),
        #selector(getter: UnitVolume.gallons),
        #selector(getter: UnitVolume.imperialFluidOunces),
        #selector(getter: UnitVolume.imperialGallons),
        #selector(getter: UnitVolume.imperialPints),
        #selector(getter: UnitVolume.imperialQuarts),
        #selector(getter: UnitVolume.imperialTablespoons),
        #selector(getter: UnitVolume.imperialTeaspoons),
        #selector(getter: UnitVolume.kiloliters),
        #selector(getter: UnitVolume.liters),
        #selector(getter: UnitVolume.megaliters),
        #selector(getter: UnitVolume.metricCups),
        #selector(getter: UnitVolume.milliliters),
        #selector(getter: UnitVolume.pints),
        #selector(getter: UnitVolume.quarts),
        #selector(getter: UnitVolume.tablespoons),
        #selector(getter: UnitVolume.teaspoons),
    ]

    lazy var all:[(Dimension.Type,[Selector])] = [
        (UnitAcceleration.self, accelerations),
        (UnitAngle.self, angles),
        (UnitArea.self, areas),
        (UnitConcentrationMass.self, concentrationMasses),
        (UnitDispersion.self, dispersions),
        (UnitDuration.self, durations),
        (UnitElectricCharge.self, electricCharges),
        (UnitElectricCurrent.self, electricCurrents),
        (UnitElectricPotentialDifference.self, electricPotentialDifferences),
        (UnitElectricResistance.self, electricResistances),
        (UnitEnergy.self, energies),
        (UnitFrequency.self, frequencies),
        (UnitFuelEfficiency.self, fuelEfficiencies),
        (UnitIlluminance.self, illuminances),
        (UnitLength.self, lengths),
        (UnitMass.self, masses),
        (UnitPower.self, powers),
        (UnitPressure.self, pressures),
        (UnitSpeed.self, speeds),
        (UnitTemperature.self, tempuratures),
        (UnitVolume.self, volumes),
    ]

    lazy var locales: [LocaleOption] = {
        return Locale.availableIdentifiers.sorted().map { id in
            return LocaleOption(identifier: id, isDefault: id == defaultLocaleIdentifier)
        }
    }()

    let defaultLocaleIdentifier = "en_US_POSIX"

    lazy var dimensionsReference: [DimensionOption] = {
        return self.all.map { (arg) -> DimensionOption in
            let (type, selectors) = arg
            let baseUnit = MeasurementFormatters.medium.string(from: type.baseUnit())
            return DimensionOption(identifier: "\(type)", baseUnit: baseUnit, units: selectors.compactMap {
                let name = "\($0)"
                guard let unit = self.dimensionIdentifiers[name] else { return nil }
                let measurement = Measurement(value: 2, unit: unit)
                return UnitReference(
                    identifier: name,
                    shortFormat: MeasurementFormatters.short.string(from: measurement),
                    mediumFormat: MeasurementFormatters.medium.string(from: measurement),
                    longFormat: MeasurementFormatters.long.string(from: measurement)
                )

            })
        }
    }()
    
    static func createUnit<T:Dimension>(_ type: T.Type, _ selector:Selector) -> T {
        guard let result = type.perform(selector)?.takeUnretainedValue() as? T else {
            fatalError("Could not create unit type: \(T.self) using selector: \(selector)")
        }
        return result
    }

}
