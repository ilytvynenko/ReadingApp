import UIKit

extension Style {
    enum Reading {
        ///Colors
        static var backImageTintColor: UIColor {
            .black
        }
        static var backgroundColor: UIColor {
            .white
        }
        static var barTintColor: UIColor {
            .white
        }
        static var chapterLabelColor: UIColor {
            UIColor(red: 11 / 255, green: 8 / 255, blue: 15 / 255, alpha: 1)
        }

        ///Fonts
        static var chapterTitleFont: UIFont? {
            UIFont(name: "NunitoSans-Bold", size: 16)
        }
        static var chapterLabelFont: UIFont? {
            UIFont(name: "Georgia", size: 16)
        }

        ///Images
        static var backImage: UIImage? {
            UIImage(named: "back")
        }

        ///Layout
        static var chapterLabelTopMargin: CGFloat {
            8
        }
        static var chapterLabelHeight: CGFloat {
            22
        }
        static var chapterLabelLeadingMargin: CGFloat {
            16
        }
        static var chapterLabelTrailingMargin: CGFloat {
            -16
        }
        static var chapterTextLabelBottomMargin: CGFloat {
            -8
        }
        static var chapterTextLabelLeadingMargin: CGFloat {
            16
        }
        static var chapterTextLabelTrailingMargin: CGFloat {
            -16
        }

        ///Other
        static var tableViewSeparatorStyle: UITableViewCell.SeparatorStyle {
            .none
        }
        static var textLineHeightMultiple: CGFloat {
            1.32
        }
        static var cellSelectionStyle: UITableViewCell.SelectionStyle {
            .none
        }
        static var chapterTextLabelNumberOfLines: Int {
            0
        }
        static var chapterTextLabelLineBreakingMode: NSLineBreakMode {
            .byWordWrapping
        }
    }
}
