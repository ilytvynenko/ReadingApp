import UIKit

extension ReadingViewController {
    func makeDataSource() -> UITableViewDiffableDataSource<Int, NSAttributedString> {
        let dataSource = UITableViewDiffableDataSource<Int, NSAttributedString>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Utility.chapterCellID, for: indexPath) as? ChapterTableViewCell
            return cell ?? UITableViewCell()
        }
        return dataSource
    }

    func update(animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, NSAttributedString>()
        snapshot.appendSections([1])
        snapshot.appendItems(chapters, toSection: 1)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}
