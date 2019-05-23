import Vapor
import Leaf

class FormatterController {

    struct ViewData: Codable {
        let locales: [LocaleOption]
        let dimensions: [DimensionOption]
        let unitOptions: [String]
        let unitStyles: [String]
    }

    func index(_ req: Request) throws -> Future<View> {
        let context = ViewData(
            locales: Database.shared.locales,
            dimensions: Database.shared.dimensionsReference,
            unitOptions: Array(Database.shared.unitOptionsIdentifiers.keys),
            unitStyles: Array(Database.shared.unitStyleIdentifiers.keys)
        )
        return try req.view().render("index", context)
    }

    private var defaultUnitOptionsIdentifier: String {
        return "providedUnit"
    }

    private var defaultUnitStyleIdentifier: String {
        return "short"
    }

    struct FormatResult : Content {
        let status: String
        let result: String
    }

    func format(_ req: Request) throws -> FormatResult {
        let value: Double? = try? req.content.syncGet(at: "value")
        let dimensionIdentifier: String = try req.content.syncGet(at: "dimension")
        let unitOptionsIdentifier: String = (try? req.content.syncGet(at: "unitOptions")) ?? defaultUnitOptionsIdentifier
        let unitStyleIdentifier: String = (try? req.content.syncGet(at: "unitStyle")) ?? defaultUnitStyleIdentifier
        let localeIdentifier: String = (try? req.content.syncGet(at: "locale")) ?? Database.shared.defaultLocaleIdentifier

        guard let unitOptions = Database.shared.unitOptionsIdentifiers[unitOptionsIdentifier] else {
            throw Abort(.badRequest, headers: [:], reason: "Invalid unitOptions parameter", identifier: nil, suggestedFixes: [])
        }
        guard let unitStyle = Database.shared.unitStyleIdentifiers[unitStyleIdentifier] else {
            throw Abort(.badRequest, headers: [:], reason: "Invalid unitStyle parameter", identifier: nil, suggestedFixes: [])
        }
        guard let dimension = Database.shared.dimensionIdentifiers[dimensionIdentifier] else {
            throw Abort(.badRequest, headers: [:], reason: "Invalid dimension parameter", identifier: nil, suggestedFixes: [])
        }

        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: localeIdentifier)
        formatter.unitOptions = unitOptions
        formatter.unitStyle = unitStyle

        let result:String
        if let value = value {
            let measurement = Measurement(value: value, unit: dimension)
            result = formatter.string(from: measurement)
        } else {
            result = formatter.string(from: dimension)
        }
        return FormatResult(status: "ok", result: result)
    }

}
