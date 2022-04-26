struct DecodingError: Error {
    var localizedDescription = "Decoding error occured"
    init() { }
}

struct FetchingError: Error {
    var localizedDescription = "Fetching error occured"
    init() { }
}

