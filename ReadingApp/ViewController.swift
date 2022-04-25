import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let networkManager = NetworkManager()
        networkManager.getChapter(from: .hotBayouNights, number: 1) { response in
            switch response {
            case .success(let attributedString):
                print(attributedString)
            default:
                break
            }
        }
    }

}

