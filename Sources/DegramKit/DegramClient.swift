import Foundation

#if os(Linux)
    import Dispatch
#endif

public final class DegramClient {
    private let session = URLSession.shared

    private let queue = DispatchQueue(label: "com.degram.clientqueue", qos: .utility, attributes: .concurrent)

    private lazy var endpoint =  PostEndpoint(base: url)

    public let token: String
    private let url: URL

    public init(token: String, _ url: URL = URL(string: "http://185.246.66.87/api/send")!) {
        self.token = token
        self.url = url
    }
    
    internal func workAsync(_ items: Any?..., separator: String, terminator: String, converter: @escaping (Any?) -> String, _ callback: ((Bool) -> Void)? = nil) {
        queue.async {
            self.work(items, separator: separator, terminator: terminator, converter: converter, callback)
        }
    }

    internal func work(_ items: Any?..., separator: String, terminator: String, converter: (Any?) -> String, _ callback: ((Bool) -> Void)? = nil) {
        guard items.count > 0 else {
            callback?(false)
            return
        }
        let payload = convert(items, separator: separator, terminator: terminator, converter: converter)
        post(message: payload, callback)
    }

    internal func convert(_ items: Any?..., separator: String, terminator: String, converter: (Any?) -> String) -> String {
        return "\(items.map(converter).joined(separator: separator))\(terminator)"
    }

    internal func post(message: String, _ callback: ((Bool) -> Void)? = nil) {
        guard let request = endpoint.prepare(token, message: message) else {
            callback?(false)
            return
        }
        session.dataTask(with: request) { data, response, error in 
            if error != nil {
                callback?(false)
                return
            }
            if let resp = response as? HTTPURLResponse {
                callback?(resp.statusCode == 200)
                return
            }
            callback?(false)
        }.resume()
    }
}