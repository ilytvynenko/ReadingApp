import UIKit

enum NetworkResponse {
    enum Output {
        case text(NSAttributedString)
        case image(UIImage)
    }
    case error(Error)
    case success(Output)
}
