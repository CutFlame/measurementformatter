import Leaf
import Vapor

/// Called before your application initializes.
public func configure(_ app: Application) throws {

    app.middleware.use(EnforceSSLMiddleware())
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(ErrorMiddleware.default(environment: app.environment))

    
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = false    
    
    // register routes
    try routes(app)
}
