import Foundation

internal final class GetEndpoint: Endpoint {
    internal let base: URL

    internal init(base url: URL) {
        base = url
    }

    internal func prepare(_ payload: String) -> URLRequest {
        return URLRequest(url: base)
    }

    internal func percentEncode(_ payload: String) -> String? {
        return payload.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}