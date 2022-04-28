import FirebaseStorage

protocol NetworkManagerProtocol {
    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void)
    func getImage(from novel: Novel, completionHandler: @escaping (NetworkResponse) -> Void)
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

    func getImage(from novel: Novel, completionHandler: @escaping (NetworkResponse) -> Void) {
        let novelName = novel.rawValue.capitalizeFirstLetter()
        let reference = storage.reference().child("\(novelName)/image.jpg")
        reference.getData(maxSize: maxDataSize) { data, error in
            if let error = error {
                completionHandler(.error(error))
            } else {
                guard let data = data,
                    let image = UIImage(data: data)
                else {
                    completionHandler(.error(DecodingError()))
                    return
                }
                completionHandler(.success(.image(image)))
            }
        }
    }

    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void) {
        let novelName = novel.rawValue.capitalizeFirstLetter()
        let reference = storage.reference().child("\(novelName)/\(novelName)\(number).html")
        reference.getData(maxSize: maxDataSize) { data, error in
            if let error = error {
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
                completionHandler(.success(.text([decodedString])))
            }
        }
    }
}
