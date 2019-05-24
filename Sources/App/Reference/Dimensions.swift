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
}
