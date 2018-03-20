import Foundation

protocol Endpoint {
    init(base url: URL)

    func prepare(_ token: String, message: String) -> URLRequest?
}