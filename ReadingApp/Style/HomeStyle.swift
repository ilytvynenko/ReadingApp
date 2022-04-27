import UIKit

extension Style {
    enum Home {
        ///Colors
        static var backgroundColor: UIColor {
            UIColor(red: 15 / 255, green: 15 / 255, blue: 15 / 255, alpha: 1)
        }
        static var titleColor: UIColor {
            UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
        }
        static var sectionTitleColor: UIColor {
            .white
        }
        static var collectionViewCellTitleColor: UIColor {
            UIColor(red: 235 / 255, green: 237 / 255, blue: 240 / 255, alpha: 1)
        }
        static var tabTintColor: UIColor {
            UIColor(red: 208 / 255, green: 0 / 255, blue: 110 / 255, alpha: 1)
        }
        
        ///Fonts
        static var titleFont: UIFont? {
            UIFont(name: "NunitoSans-Bold", size: 20)
        }
        static var cellTitleFont: UIFont? {
            UIFont(name: "NunitoSans-Bold", size: 14)
        }
        
        ///Layout
        static var titleLeftMargin: CGFloat {
            16
        }
        static var categoryTitleViewHeight: CGFloat {
            56
        }
        static var stackViewHeight: CGFloat {
            24
        }
        static var stackViewWidth: CGFloat {
            200
        }
        static var collectionViewCellItemWidth: CGFloat {
            120
        }
        static var collectionViewCellItemFractionalHight: CGFloat {
            1
        }
        static var collectionViewCellGroupFractionalWidth: CGFloat {
            1
        }
        static var collectionViewCellGroupHeight: CGFloat {
            200
        }
        static var collectionViewCellIconHeight: CGFloat {
            150
        }
        static var collectionViewLeftMargin: CGFloat {
            16
        }
        static var collectionViewCellLabelRightMargin: CGFloat {
            -16
        }
        static var collectionViewCellLabelTopMargin: CGFloat {
            8
        }
        static var collectionViewHeaderFractionalWidth: CGFloat {
            1
        }
        
        //Images
        static var starImage: UIImage? {
            UIImage(named: "star")
        }
        
        static var homeImage: UIImage? {
            UIImage(named: "home")
        }
        
        ///Other
        static var titleAlignment: NSTextAlignment {
            .left
        }
        static var stackViewAxis: NSLayoutConstraint.Axis {
            .horizontal
        }
        static var stackViewSpacing: CGFloat {
            9
        }
        static var imageViewContentMode: UIView.ContentMode {
            .scaleAspectFit
        }
        static var collectionViewItemContentInset: NSDirectionalEdgeInsets {
            NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        }
        static var collectionViewCellIconCornerRadius: CGFloat {
            8
        }
        static var collectionViewCellLabelNumberOfLines: Int {
            2
        }
    }
}
