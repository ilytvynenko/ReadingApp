protocol PresenterProtocol {
    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void)
    func getNovelCovers(from novels: [Novel], completionHandler: @escaping (NetworkResponse) -> Void)
}

class Presenter {
    private var networkManager: NetworkManagerProtocol = NetworkManager()
}

//MARK: - PresenterProtocol
extension Presenter: PresenterProtocol {
    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void) {
        networkManager.getChapter(from: novel, number: number, completionHandler: completionHandler)
    }
    func getNovelCovers(from novels: [Novel], completionHandler: @escaping (NetworkResponse) -> Void) {
        var covers: [NovelCover] = []
        novels.forEach { novel in
            getImage(from: novel) { response in
                switch response {
                case .error(let error):
                    completionHandler(.error(error))
                case .success(.image(let image)):
                    covers.append(NovelCover(title: novel.title, icon: image))
                    if covers.count == novels.count {
                        completionHandler(.success(.covers(covers)))
                    }
                default:
                    completionHandler(.error(FetchingError()))
                }
            }
        }
    }

}

//MARK: Private
private extension Presenter {
    func getImage(from novel: Novel, completionHandler: @escaping (NetworkResponse) -> Void) {
        networkManager.getImage(from: novel, completionHandler: completionHandler)
    }
}
