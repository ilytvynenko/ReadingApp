import UIKit

enum NetworkResponse {
    enum Output {
        case text([String])
        case image(UIImage)
        case covers([NovelCover])
    }
    case error(Error)
    case success(Output)
}
