import UIKit

class HomeViewController: UIViewController {

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    lazy var dataSource: UICollectionViewDiffableDataSource<Section, NovelCover> = makeDataSource()
    var covers: [NovelCover] = [] {
        didSet {
            update(with: covers)
        }
    }

    private var presenter: PresenterProtocol = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        presenter.getNovelCovers(from: Novel.allCases) { response in
            switch response {
            case .success(.covers(let covers)):
                self.covers = covers
            default:
                break
            }
        }
    }
}

//MARK: -  UI Configuration
extension HomeViewController {

    func setupUI() {
        view.backgroundColor = Style.Home.backgroundColor

        ///Navigation bar
        let titleLabel = UILabel()
        titleLabel.textColor = Style.Home.titleColor
        titleLabel.text = Strings.Home.title
        titleLabel.font = Style.Home.titleFont
        titleLabel.textAlignment = Style.Home.titleAlignment
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = titleLabel
        guard let containerView = self.navigationItem.titleView?.superview?.safeAreaLayoutGuide else { return }
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                constant: Style.Home.titleLeftMargin),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])

        ///Collection view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = Style.Home.backgroundColor
        collectionView.register(NovelCoverCell.self, forCellWithReuseIdentifier: Strings.Utility.novelCoverCellID)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Style.Home.collectionViewLeftMargin),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let headerRegistration = UICollectionView.SupplementaryRegistration
            <HomeSectionHeader>(elementKind: UICollectionView.elementKindSectionHeader) { _,_,_ in}
        dataSource.supplementaryViewProvider = { supplementaryView, elementKind, indexPath in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
        
        ///Tab bar
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = Style.Home.tabTintColor
        let firstViewController = UIViewController()
        firstViewController.tabBarItem = UITabBarItem(title: Strings.Home.tab, image: Style.Home.homeImage, tag: 0)
        tabBarController.viewControllers = [firstViewController]
        view.addSubview(tabBarController.view)
    }
}
