import Foundation

extension PostEndpoint {
     internal class RequestBody: Encodable {
        let token: String
        let message: String
        
        init(token: String, message: String) {
            self.token = token
            self.message = message
        }
    }
}

internal final class PostEndpoint: Endpoint {
    internal let base: URL
    internal let encoder = JSONEncoder()

    internal init(base url: URL) {
        base = url
    }

    internal func prepare(_ token: String, message: String) -> URLRequest? {
        let body = RequestBody(token: token, message: message)

        guard let data = try? encoder.encode(body) else {
            return nil
        }

        var request = URLRequest(url: base)

        request.httpMethod = "POST"
        request.httpBody = data

        return request
    }
}