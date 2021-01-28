import Vapor

struct EnforceSSLMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        guard request.application.environment == Environment.production else {
            return next.respond(to: request)
        }

        let headers = request.headers

        // Heroku's router will add this header, which will include the original request's protocol (http or https)
        let scheme = headers.first(name: HTTPHeaders.Name("X-Forwarded-Proto"))
            ?? request.url.scheme
            ?? "http"

        guard scheme == "https" else {
            guard let host = headers.first(name: HTTPHeaders.Name.host) else {
                return request.eventLoop.future(error: Abort(.badRequest))
            }
            guard let url = URL(string: request.url.path) else {
                return request.eventLoop.future(error: Abort(.badRequest))
            }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.scheme = "https"

            if host.contains(":") {
                let parts = host.split(separator: ":")
                components?.host = String(parts.first!)
                if let port = parts.last.flatMap({ String($0) }).flatMap(Int.init) {
                    components?.port = port
                }
            } else {
                components?.host = host
            }

            guard let httpsURL = components?.url else {
                request.logger.error("Unable to construct HTTPS URL out of components: scheme: \(scheme)  host: \(host)  original url: \(request.url.path)")
                return request.eventLoop.future(error: Abort(.internalServerError))
            }

            request.logger.info("Redirecting to HTTPS: \(httpsURL)")
            return request.eventLoop.future(
                request.redirect(to: httpsURL.absoluteString, type: .permanent)
            )
        }

        return next.respond(to: request)
    }
}
