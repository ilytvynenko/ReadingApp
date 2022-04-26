import UIKit

class HomeViewController: UIViewController {
    
    private var presenter: PresenterProtocol = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
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
        guard let containerView = self.navigationItem.titleView?.superview else { return }
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                             constant:  Style.Home.titleLeftMargin),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        ///Category title view
        let categoryTitleView = UIView()
        categoryTitleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryTitleView)
        NSLayoutConstraint.activate([
            categoryTitleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryTitleView.heightAnchor.constraint(equalToConstant: Style.Home.categoryTitleViewHeight),
            categoryTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = Style.Home.stackViewSpacing
        categoryTitleView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: categoryTitleView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: categoryTitleView.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: Style.Home.stackViewHeight),
            stackView.widthAnchor.constraint(equalToConstant: Style.Home.stackViewWidth)
        ])
        
        let imageView = UIImageView()
        imageView.image = Style.Home.starImage
        imageView.contentMode = Style.Home.imageViewContentMode
        stackView.addArrangedSubview(imageView)
        
        let categoryTitleLabel = UILabel()
        categoryTitleLabel.text = Strings.Home.categoryTitle
        categoryTitleLabel.textColor = Style.Home.titleColor
        categoryTitleLabel.font = Style.Home.titleFont
        stackView.addArrangedSubview(categoryTitleLabel)
    }
}

