import UIKit

class HomeSectionHeader: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI Configuretion
private extension HomeSectionHeader {
    func setupUI() {
        backgroundColor = Style.Home.backgroundColor

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = Style.Home.stackViewSpacing
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Style.Home.collectionViewLeftMargin),
            stackView.heightAnchor.constraint(equalToConstant: Style.Home.stackViewHeight),
            stackView.widthAnchor.constraint(equalToConstant: Style.Home.stackViewWidth)
        ])

        let imageView = UIImageView()
        imageView.image = Style.Home.starImage
        imageView.contentMode = Style.Home.imageViewContentMode
        stackView.addArrangedSubview(imageView)

        let categoryTitleLabel = UILabel()
        categoryTitleLabel.text = Strings.Home.categoryTitle
        categoryTitleLabel.textColor = Style.Home.sectionTitleColor
        categoryTitleLabel.font = Style.Home.titleFont
        stackView.addArrangedSubview(categoryTitleLabel)
    }
}
