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
        
        ///Fonts
        static var titleFont: UIFont? {
            UIFont(name: "NunitoSans-Bold", size: 20)
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
        
        //Images
        static var starImage: UIImage? {
            UIImage(named: "star")
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
    }
}
