import Foundation

protocol Endpoint {
    init(base url: URL)

    func prepare(_ payload: String) -> URLRequest
}