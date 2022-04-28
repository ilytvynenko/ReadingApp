import UIKit

extension ReadingViewController {
    func makeDataSource() -> UITableViewDiffableDataSource<Int, String> {
        let dataSource = UITableViewDiffableDataSource<Int, String>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.Utility.chapterCellID, for: indexPath) as? ChapterTableViewCell
            cell?.configure(with: self.chapters[indexPath.row],
                            chapterNumber: indexPath.row + 1)
            return cell ?? UITableViewCell()
        }
        return dataSource
    }

    func update(animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([1])
        snapshot.appendItems(chapters, toSection: 1)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}

//MARK: -  UITableViewDataSourcePrefetching
extension ReadingViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.row == lastCapter - chaptersPerDownload {
                getChapters(number: chaptersPerDownload)
            }
        }
    }
}
