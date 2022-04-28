import UIKit

class ChapterTableViewCell: UITableViewCell {
    let chapterTextLabel = UILabel()
    let chapterLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with text: String, chapterNumber: Int) {
        configureTitleLabel(with: text, chapterNumber: chapterNumber)
        configureTextLabel(with: text)
    }
}

//MARK: - UI Configuration
private extension ChapterTableViewCell {
    func setupUI() {
        selectionStyle = Style.Reading.cellSelectionStyle
        chapterLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(chapterLabel)
        NSLayoutConstraint.activate([
            chapterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Style.Reading.chapterLabelTopMargin),
            chapterLabel.heightAnchor.constraint(equalToConstant: Style.Reading.chapterLabelHeight),
            chapterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: Style.Reading.chapterLabelLeadingMargin),
            chapterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: Style.Reading.chapterLabelTrailingMargin)
        ])

        chapterTextLabel.numberOfLines = Style.Reading.chapterTextLabelNumberOfLines
        chapterTextLabel.lineBreakMode = Style.Reading.chapterTextLabelLineBreakingMode
        chapterTextLabel.font = Style.Reading.chapterLabelFont
        chapterTextLabel.textColor = Style.Reading.chapterLabelColor
        chapterTextLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(chapterTextLabel)
        NSLayoutConstraint.activate([
            chapterTextLabel.topAnchor.constraint(equalTo: chapterLabel.bottomAnchor),
            chapterTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                     constant: Style.Reading.chapterTextLabelBottomMargin),
            chapterTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                      constant: Style.Reading.chapterTextLabelLeadingMargin),
            chapterTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                       constant: Style.Reading.chapterTextLabelTrailingMargin)
        ])
    }
}

//MARK: - Private
private extension ChapterTableViewCell {
    func configureTitleLabel(with text: String, chapterNumber: Int) {
        let string = Strings.Reading.chapter + " " + String(chapterNumber)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(NSAttributedString.Key.font,
                                      value: Style.Reading.chapterTitleFont,
                                      range: NSRange(location: 0,
                                                     length: string.count))
        chapterLabel.attributedText = attributedString
    }

    func configureTextLabel(with text: String) {
        var text = text
        text = text.replacingOccurrences(of: Strings.Common.gapLine,
                                         with: Strings.Common.newLine)
        text = text.replacingOccurrences(of: Strings.Common.newLine,
                                         with: Strings.Common.gapLine)
        let i = text.firstIndex(of: "\n")
        let lowerBound = text.index(text.startIndex,
                                    offsetBy: (i?.utf16Offset(in: text) ?? 0) + 1)
        text.removeSubrange(Range(uncheckedBounds: (lower: text.startIndex,
                                                    upper: lowerBound)))
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = Style.Reading.textLineHeightMultiple
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSMakeRange(0, attributedString.length))
        chapterTextLabel.attributedText = attributedString
    }
}

