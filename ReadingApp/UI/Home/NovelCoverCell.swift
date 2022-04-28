import UIKit

class NovelCoverCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with cover: NovelCover) {
        imageView.image = cover.icon
        nameLabel.text = cover.novel.title
    }
}

//MARK: -  UI Configuration
private extension NovelCoverCell {
    func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Style.Home.collectionViewCellIconCornerRadius
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Style.Home.collectionViewCellIconHeight)
        ])
        
        nameLabel.textColor = Style.Home.collectionViewCellTitleColor
        nameLabel.font = Style.Home.cellTitleFont
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = Style.Home.collectionViewCellLabelNumberOfLines
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Style.Home.collectionViewCellLabelRightMargin),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Style.Home.collectionViewCellLabelTopMargin)
        ])
    }
}
