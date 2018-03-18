import Foundation

#if os(Linux)
    import Dispatch
#endif

public class DegramClient {
    private let session = URLSession.shared

    private let queue = DispatchQueue(label: "com.degram.clientqueue", qos: .utility, attributes: .concurrent)
    
    internal func workAsync(_ items: Any?..., separator: String, terminator: String, converter: @escaping (Any?) -> String, _ callback: ((Bool) -> Void)? = nil) {
        queue.async {
            self.work(items, separator: separator, terminator: terminator, converter: converter, callback)
        }
    }

    internal func work(_ items: Any?..., separator: String, terminator: String, converter: (Any?) -> String, _ callback: ((Bool) -> Void)? = nil) {
        guard items.count > 0 else {
            return
        }
        let payload = convert(items, separator: separator, terminator: terminator, converter: converter)
    }

    internal func convert(_ items: Any?..., separator: String, terminator: String, converter: (Any?) -> String) -> String {
        return ""
    }

    internal func post(message: String, _ callback: ((Bool) -> Void)? = nil) {

    }
}