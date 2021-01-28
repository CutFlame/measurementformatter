import Vapor

/// Register your application's routes here.
public func routes(_ app: Application) throws {
    let formatterController = FormatterController()
    app.get(use: formatterController.index)
    app.post("format", use: formatterController.format)
}
