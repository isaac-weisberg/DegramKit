public extension DegramClient {
    private var debugConverter: (Any?) -> String {  
        return { object in
            String(reflecting: object)
        }
    }

    private var descriptionConverter: (Any?) -> String {
        return { object in
            String(describing: object)
        }
    }

    public func debugPrint(_ items: Any?..., separator: String = " ", terminator: String = "\n") {
        work(items, separator: separator, terminator: terminator, converter: debugConverter)
    }

    public func print(_ items: Any?..., separator: String = " ", terminator: String = "\n") {
        work(items, separator: separator, terminator: terminator, converter: descriptionConverter)
    }
}