import UIKit

class ViewController: UIViewController {
    
    private var presenter: PresenterProtocol = Presenter()
    
    //TODO: implement get image method
    //TODO: investigate scrolling issue
    //TODO: layout

    override func viewDidLoad() {
        super.viewDidLoad()
    
        presenter.getChapter(from: .hotBayouNights, number: 1) { response in
            switch response {
            case .success(let attributedString):
                print(attributedString)
            default:
                break
            }
        }
    }

}

