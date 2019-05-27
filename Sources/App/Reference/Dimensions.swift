//
//  Dimensions.swift
//  App
//
//  Created by Michael Holt on 5/24/19.
//

import Foundation

struct Dimensions {
    fileprivate init() {}

    static let unitTypes: [Unit.Type] = [
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

    #if os(macOS)

    static let all: [(Dimension.Type, [Selector])] = [
        (UnitAcceleration.self, Dimensions.accelerations),
        (UnitAngle.self, Dimensions.angles),
        (UnitArea.self, Dimensions.areas),
        (UnitConcentrationMass.self, Dimensions.concentrationMasses),
        (UnitDispersion.self, Dimensions.dispersions),
        (UnitDuration.self, Dimensions.durations),
        (UnitElectricCharge.self, Dimensions.electricCharges),
        (UnitElectricCurrent.self, Dimensions.electricCurrents),
        (UnitElectricPotentialDifference.self, Dimensions.electricPotentialDifferences),
        (UnitElectricResistance.self, Dimensions.electricResistances),
        (UnitEnergy.self, Dimensions.energies),
        (UnitFrequency.self, Dimensions.frequencies),
        (UnitFuelEfficiency.self, Dimensions.fuelEfficiencies),
        (UnitIlluminance.self, Dimensions.illuminances),
        (UnitLength.self, Dimensions.lengths),
        (UnitMass.self, Dimensions.masses),
        (UnitPower.self, Dimensions.powers),
        (UnitPressure.self, Dimensions.pressures),
        (UnitSpeed.self, Dimensions.speeds),
        (UnitTemperature.self, Dimensions.tempuratures),
        (UnitVolume.self, Dimensions.volumes),
    ]

    static let accelerations = [
        #selector(getter: UnitAcceleration.gravity),
        #selector(getter: UnitAcceleration.metersPerSecondSquared),
    ]
    static let angles = [
        #selector(getter: UnitAngle.arcMinutes),
        #selector(getter: UnitAngle.arcSeconds),
        #selector(getter: UnitAngle.degrees),
        #selector(getter: UnitAngle.gradians),
        #selector(getter: UnitAngle.radians),
        #selector(getter: UnitAngle.revolutions),
    ]
    static let areas = [
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
    static let concentrationMasses = [
        #selector(getter: UnitConcentrationMass.gramsPerLiter),
        #selector(getter: UnitConcentrationMass.milligramsPerDeciliter),
    ]
    static let dispersions = [
        #selector(getter: UnitDispersion.partsPerMillion),
    ]
    static let durations = [
        #selector(getter: UnitDuration.hours),
        #selector(getter: UnitDuration.minutes),
        #selector(getter: UnitDuration.seconds),
    ]
    static let electricCharges = [
        #selector(getter: UnitElectricCharge.ampereHours),
        #selector(getter: UnitElectricCharge.coulombs),
        #selector(getter: UnitElectricCharge.kiloampereHours),
        #selector(getter: UnitElectricCharge.megaampereHours),
        #selector(getter: UnitElectricCharge.microampereHours),
        #selector(getter: UnitElectricCharge.milliampereHours),
    ]
    static let electricCurrents = [
        #selector(getter: UnitElectricCurrent.amperes),
        #selector(getter: UnitElectricCurrent.kiloamperes),
        #selector(getter: UnitElectricCurrent.megaamperes),
        #selector(getter: UnitElectricCurrent.microamperes),
        #selector(getter: UnitElectricCurrent.milliamperes),
    ]
    static let electricPotentialDifferences = [
        #selector(getter: UnitElectricPotentialDifference.kilovolts),
        #selector(getter: UnitElectricPotentialDifference.megavolts),
        #selector(getter: UnitElectricPotentialDifference.microvolts),
        #selector(getter: UnitElectricPotentialDifference.millivolts),
        #selector(getter: UnitElectricPotentialDifference.volts),
    ]
    static let electricResistances = [
        #selector(getter: UnitElectricResistance.kiloohms),
        #selector(getter: UnitElectricResistance.megaohms),
        #selector(getter: UnitElectricResistance.microohms),
        #selector(getter: UnitElectricResistance.milliohms),
        #selector(getter: UnitElectricResistance.ohms),
    ]
    static let energies = [
        #selector(getter: UnitEnergy.calories),
        #selector(getter: UnitEnergy.joules),
        #selector(getter: UnitEnergy.kilocalories),
        #selector(getter: UnitEnergy.kilojoules),
        #selector(getter: UnitEnergy.kilowattHours),
    ]
    static let frequencies = [
        #selector(getter: UnitFrequency.gigahertz),
        #selector(getter: UnitFrequency.hertz),
        #selector(getter: UnitFrequency.kilohertz),
        #selector(getter: UnitFrequency.megahertz),
        #selector(getter: UnitFrequency.microhertz),
        #selector(getter: UnitFrequency.millihertz),
        #selector(getter: UnitFrequency.nanohertz),
        #selector(getter: UnitFrequency.terahertz),
    ]
    static let fuelEfficiencies = [
        #selector(getter: UnitFuelEfficiency.litersPer100Kilometers),
        #selector(getter: UnitFuelEfficiency.milesPerGallon),
        #selector(getter: UnitFuelEfficiency.milesPerImperialGallon),
    ]
    static let illuminances = [
        #selector(getter: UnitIlluminance.lux),
    ]
    static let lengths = [
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
    static let masses = [
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
    static let powers = [
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
    static let pressures = [
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
    static let speeds = [
        #selector(getter: UnitSpeed.kilometersPerHour),
        #selector(getter: UnitSpeed.knots),
        #selector(getter: UnitSpeed.metersPerSecond),
        #selector(getter: UnitSpeed.milesPerHour),
    ]
    static let tempuratures = [
        #selector(getter: UnitTemperature.celsius),
        #selector(getter: UnitTemperature.fahrenheit),
        #selector(getter: UnitTemperature.kelvin),
    ]
    static let volumes = [
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
    #else

    static var all:[(Dimension.Type,[String: Dimension])] = [
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

    static let accelerations = [
        "gravity":UnitAcceleration.gravity,
        "metersPerSecondSquared":UnitAcceleration.metersPerSecondSquared,
    ]
    static let angles = [
        "arcMinutes":UnitAngle.arcMinutes,
        "arcSeconds":UnitAngle.arcSeconds,
        "degrees":UnitAngle.degrees,
        "gradians":UnitAngle.gradians,
        "radians":UnitAngle.radians,
        "revolutions":UnitAngle.revolutions,
    ]
    static let areas = [
        "acres":UnitArea.acres,
        "ares":UnitArea.ares,
        "hectares":UnitArea.hectares,
        "squareCentimeters":UnitArea.squareCentimeters,
        "squareFeet":UnitArea.squareFeet,
        "squareInches":UnitArea.squareInches,
        "squareKilometers":UnitArea.squareKilometers,
        "squareMegameters":UnitArea.squareMegameters,
        "squareMeters":UnitArea.squareMeters,
        "squareMicrometers":UnitArea.squareMicrometers,
        "squareMiles":UnitArea.squareMiles,
        "squareMillimeters":UnitArea.squareMillimeters,
        "squareNanometers":UnitArea.squareNanometers,
        "squareYards":UnitArea.squareYards,
    ]
    static let concentrationMasses = [
        "gramsPerLiter":UnitConcentrationMass.gramsPerLiter,
        "milligramsPerDeciliter":UnitConcentrationMass.milligramsPerDeciliter,
    ]
    static let dispersions = [
        "partsPerMillion":UnitDispersion.partsPerMillion,
    ]
    static let durations = [
        "hours":UnitDuration.hours,
        "minutes":UnitDuration.minutes,
        "seconds":UnitDuration.seconds,
    ]
    static let electricCharges = [
        "ampereHours":UnitElectricCharge.ampereHours,
        "coulombs":UnitElectricCharge.coulombs,
        "kiloampereHours":UnitElectricCharge.kiloampereHours,
        "megaampereHours":UnitElectricCharge.megaampereHours,
        "microampereHours":UnitElectricCharge.microampereHours,
        "milliampereHours":UnitElectricCharge.milliampereHours,
    ]
    static let electricCurrents = [
        "amperes":UnitElectricCurrent.amperes,
        "kiloamperes":UnitElectricCurrent.kiloamperes,
        "megaamperes":UnitElectricCurrent.megaamperes,
        "microamperes":UnitElectricCurrent.microamperes,
        "milliamperes":UnitElectricCurrent.milliamperes,
    ]
    static let electricPotentialDifferences = [
        "kilovolts":UnitElectricPotentialDifference.kilovolts,
        "megavolts":UnitElectricPotentialDifference.megavolts,
        "microvolts":UnitElectricPotentialDifference.microvolts,
        "millivolts":UnitElectricPotentialDifference.millivolts,
        "volts":UnitElectricPotentialDifference.volts,
    ]
    static let electricResistances = [
        "kiloohms":UnitElectricResistance.kiloohms,
        "megaohms":UnitElectricResistance.megaohms,
        "microohms":UnitElectricResistance.microohms,
        "milliohms":UnitElectricResistance.milliohms,
        "ohms":UnitElectricResistance.ohms,
    ]
    static let energies = [
        "calories":UnitEnergy.calories,
        "joules":UnitEnergy.joules,
        "kilocalories":UnitEnergy.kilocalories,
        "kilojoules":UnitEnergy.kilojoules,
        "kilowattHours":UnitEnergy.kilowattHours,
    ]
    static let frequencies = [
        "gigahertz":UnitFrequency.gigahertz,
        "hertz":UnitFrequency.hertz,
        "kilohertz":UnitFrequency.kilohertz,
        "megahertz":UnitFrequency.megahertz,
        "microhertz":UnitFrequency.microhertz,
        "millihertz":UnitFrequency.millihertz,
        "nanohertz":UnitFrequency.nanohertz,
        "terahertz":UnitFrequency.terahertz,
    ]
    static let fuelEfficiencies = [
        "litersPer100Kilometers":UnitFuelEfficiency.litersPer100Kilometers,
        "milesPerGallon":UnitFuelEfficiency.milesPerGallon,
        "milesPerImperialGallon":UnitFuelEfficiency.milesPerImperialGallon,
    ]
    static let illuminances = [
        "lux":UnitIlluminance.lux,
    ]
    static let lengths = [
        "astronomicalUnits":UnitLength.astronomicalUnits,
        "centimeters":UnitLength.centimeters,
        "decameters":UnitLength.decameters,
        "decimeters":UnitLength.decimeters,
        "fathoms":UnitLength.fathoms,
        "feet":UnitLength.feet,
        "furlongs":UnitLength.furlongs,
        "hectometers":UnitLength.hectometers,
        "inches":UnitLength.inches,
        "kilometers":UnitLength.kilometers,
        "lightyears":UnitLength.lightyears,
        "megameters":UnitLength.megameters,
        "meters":UnitLength.meters,
        "micrometers":UnitLength.micrometers,
        "miles":UnitLength.miles,
        "millimeters":UnitLength.millimeters,
        "nanometers":UnitLength.nanometers,
        "nauticalMiles":UnitLength.nauticalMiles,
        "parsecs":UnitLength.parsecs,
        "picometers":UnitLength.picometers,
        "scandinavianMiles":UnitLength.scandinavianMiles,
        "yards":UnitLength.yards,
    ]
    static let masses = [
        "carats":UnitMass.carats,
        "centigrams":UnitMass.centigrams,
        "decigrams":UnitMass.decigrams,
        "grams":UnitMass.grams,
        "kilograms":UnitMass.kilograms,
        "metricTons":UnitMass.metricTons,
        "micrograms":UnitMass.micrograms,
        "milligrams":UnitMass.milligrams,
        "nanograms":UnitMass.nanograms,
        "ounces":UnitMass.ounces,
        "ouncesTroy":UnitMass.ouncesTroy,
        "picograms":UnitMass.picograms,
        "pounds":UnitMass.pounds,
        "shortTons":UnitMass.shortTons,
        "slugs":UnitMass.slugs,
        "stones":UnitMass.stones,
    ]
    static let powers = [
        "femtowatts":UnitPower.femtowatts,
        "gigawatts":UnitPower.gigawatts,
        "horsepower":UnitPower.horsepower,
        "kilowatts":UnitPower.kilowatts,
        "megawatts":UnitPower.megawatts,
        "microwatts":UnitPower.microwatts,
        "milliwatts":UnitPower.milliwatts,
        "nanowatts":UnitPower.nanowatts,
        "picowatts":UnitPower.picowatts,
        "terawatts":UnitPower.terawatts,
        "watts":UnitPower.watts,
    ]
    static let pressures = [
        "bars":UnitPressure.bars,
        "gigapascals":UnitPressure.gigapascals,
        "hectopascals":UnitPressure.hectopascals,
        "inchesOfMercury":UnitPressure.inchesOfMercury,
        "kilopascals":UnitPressure.kilopascals,
        "megapascals":UnitPressure.megapascals,
        "millibars":UnitPressure.millibars,
        "millimetersOfMercury":UnitPressure.millimetersOfMercury,
        "newtonsPerMetersSquared":UnitPressure.newtonsPerMetersSquared,
        "poundsForcePerSquareInch":UnitPressure.poundsForcePerSquareInch,
    ]
    static let speeds = [
        "kilometersPerHour":UnitSpeed.kilometersPerHour,
        "knots":UnitSpeed.knots,
        "metersPerSecond":UnitSpeed.metersPerSecond,
        "milesPerHour":UnitSpeed.milesPerHour,
    ]
    static let tempuratures = [
        "celsius":UnitTemperature.celsius,
        "fahrenheit":UnitTemperature.fahrenheit,
        "kelvin":UnitTemperature.kelvin,
    ]
    static let volumes = [
        "acreFeet":UnitVolume.acreFeet,
        "bushels":UnitVolume.bushels,
        "centiliters":UnitVolume.centiliters,
        "cubicCentimeters":UnitVolume.cubicCentimeters,
        "cubicDecimeters":UnitVolume.cubicDecimeters,
        "cubicFeet":UnitVolume.cubicFeet,
        "cubicInches":UnitVolume.cubicInches,
        "cubicKilometers":UnitVolume.cubicKilometers,
        "cubicMeters":UnitVolume.cubicMeters,
        "cubicMiles":UnitVolume.cubicMiles,
        "cubicMillimeters":UnitVolume.cubicMillimeters,
        "cubicYards":UnitVolume.cubicYards,
        "cups":UnitVolume.cups,
        "deciliters":UnitVolume.deciliters,
        "fluidOunces":UnitVolume.fluidOunces,
        "gallons":UnitVolume.gallons,
        "imperialFluidOunces":UnitVolume.imperialFluidOunces,
        "imperialGallons":UnitVolume.imperialGallons,
        "imperialPints":UnitVolume.imperialPints,
        "imperialQuarts":UnitVolume.imperialQuarts,
        "imperialTablespoons":UnitVolume.imperialTablespoons,
        "imperialTeaspoons":UnitVolume.imperialTeaspoons,
        "kiloliters":UnitVolume.kiloliters,
        "liters":UnitVolume.liters,
        "megaliters":UnitVolume.megaliters,
        "metricCups":UnitVolume.metricCups,
        "milliliters":UnitVolume.milliliters,
        "pints":UnitVolume.pints,
        "quarts":UnitVolume.quarts,
        "tablespoons":UnitVolume.tablespoons,
        "teaspoons":UnitVolume.teaspoons,
    ]

    #endif
}
