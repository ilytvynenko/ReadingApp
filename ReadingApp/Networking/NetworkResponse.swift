import UIKit

enum NetworkResponse {
    enum Output {
        case text(NSAttributedString)
        case image(UIImage)
        case covers([NovelCover])
    }
    case error(Error)
    case success(Output)
}
