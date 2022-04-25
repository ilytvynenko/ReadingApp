import FirebaseStorage

protocol NetworkManagerProtocol {
    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void)
//    func getImage()
}

class NetworkManager {

    private let storageURl = "gs://readingapp-c55ce.appspot.com"
    private let maxDataSize: Int64 = 50000
    private let outputType: NSAttributedString.DocumentType = .html
    private let storage: Storage

    init() {
        storage = Storage.storage(url: storageURl)
    }
}

//MARK: - NetworkManagerProtocol
extension NetworkManager: NetworkManagerProtocol {

    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void) {
        let novelName = novel.rawValue.capitalizeFirstLetter()
        let reference = storage.reference().child("\(novelName)/\(novelName)\(number).html")

        reference.getData(maxSize: maxDataSize) { data, error in
            if let error = error {
                print("error \(error.localizedDescription)")
                completionHandler(.error(error))
            } else {
                guard let data = data,
                    let decodedString = try? NSAttributedString(data: data,
                                                                options: [.documentType: self.outputType,
                                                                              .characterEncoding: String.Encoding.utf8.rawValue],
                                                                documentAttributes: nil)
                    else {
                    completionHandler(.error(DecodingError()))
                    return
                }
                print("success")
                completionHandler(.success(decodedString))
            }
        }
    }
}
