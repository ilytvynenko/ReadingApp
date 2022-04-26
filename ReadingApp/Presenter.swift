protocol PresenterProtocol {
    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void)
    func getImage(from novel: Novel, completionHandler: @escaping (NetworkResponse) -> Void)
}

class Presenter {
    private var networkManager: NetworkManagerProtocol = NetworkManager()
}

//MARK: - PresenterProtocol
extension Presenter: PresenterProtocol {
    func getChapter(from novel: Novel, number: Int, completionHandler: @escaping (NetworkResponse) -> Void) {
        networkManager.getChapter(from: novel, number: number, completionHandler: completionHandler)
    }
    func getImage(from novel: Novel, completionHandler: @escaping (NetworkResponse) -> Void) {
        networkManager.getImage(from: novel, completionHandler: completionHandler)
    }
}

