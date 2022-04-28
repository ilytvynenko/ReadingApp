import UIKit

class ReadingViewController: UIViewController {

    private var presenter: PresenterProtocol = Presenter()
    private var novel: Novel
    private(set) var chaptersPerDownload = 3
    private(set) var lastCapter = 0
    private(set) var tableView = UITableView()
    private(set) var chapters: [String] = []
    private(set) lazy var dataSource: UITableViewDiffableDataSource<Int, String> = makeDataSource()

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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lastCapter = 0
        getChapters(number: chaptersPerDownload)
    }
}

//MARK: - UI Configuration
private extension ReadingViewController {
    func setupUI() {
        view.backgroundColor = Style.Reading.backgroundColor

        ///Back button
        let backButton = UIBarButtonItem(image: Style.Reading.backImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(popToHome))
        backButton.tintColor = Style.Reading.backImageTintColor
        navigationItem.leftBarButtonItem = backButton
        navigationController?.navigationBar.barTintColor = Style.Reading.barTintColor

        ///Table View
        tableView.dataSource = dataSource
        tableView.separatorStyle = Style.Reading.tableViewSeparatorStyle
        tableView.prefetchDataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChapterTableViewCell.self, forCellReuseIdentifier: Strings.Utility.chapterCellID)
        tableView.rowHeight = UITableView.automaticDimension
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
                let alert = UIAlertController(title: Strings.Common.errorOccured, message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: Strings.Common.ok, style: UIAlertAction.Style.default, handler: nil))
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
