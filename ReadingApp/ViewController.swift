import UIKit

class ViewController: UIViewController {
    
    private var presenter: PresenterProtocol = Presenter()
    
    //TODO: investigate scrolling issue
    //TODO: layout

    override func viewDidLoad() {
        super.viewDidLoad()
    
        presenter.getImage(from: .hotBayouNights) { response in
            switch response {
            case .success(let image):
                print(image)
            default:
                break
            }
        }
    }

}

