import UIKit

class ReadingViewController: UIViewController {

    //TODO: Limit numbers of chapters

    private var presenter: PresenterProtocol = Presenter()
    private var novel: Novel
    private(set) var tableView = UITableView()
    private(set) var lastCapter = 1
    private(set) var chapters: [NSAttributedString] = []
    private(set) lazy var dataSource: UITableViewDiffableDataSource<Int, NSAttributedString> = makeDataSource()

    init(novel: Novel) {
        self.novel = novel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getChapters(number: 5)
    }
}

//MARK: - UI Configuration
private extension ReadingViewController {
    func setupUI() {
        view.backgroundColor = .white

        ///Back button
        let backButton = UIBarButtonItem(image: Style.Reading.backImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(popToHome))
        backButton.tintColor = Style.Reading.backImageTintColor
        navigationItem.leftBarButtonItem = backButton

        ///Table View
        tableView.dataSource = dataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChapterTableViewCell.self, forCellReuseIdentifier: Strings.Utility.chapterCellID)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - Status Bar
extension ReadingViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
            .darkContent
    }
}

//MARK: - Networking
extension ReadingViewController {
    func getChapters(number: Int) {
        presenter.getChapters(from: novel, start: lastCapter + 1, end: lastCapter + number) { response in
            switch response {
            case .success(.text(let newChapters)):
                self.lastCapter += number
                self.chapters.append(contentsOf: newChapters)
                self.update()
            case .error(let error):
                print(error)
            default:
                break
            }
        }
    }
}

//MARK: - Actions
private extension ReadingViewController {
    @objc
    private func popToHome() {
        navigationController?.popViewController(animated: true)
    }
}
