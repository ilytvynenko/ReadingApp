import UIKit

extension HomeViewController {
    enum Section: CaseIterable {
        case premiumStories
    }

    func makeDataSource() -> UICollectionViewDiffableDataSource<Section, NovelCover> {
        UICollectionViewDiffableDataSource<Section, NovelCover>(collectionView: collectionView) { collectionView, indexPath, novelCover in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Utility.novelCoverCellID, for: indexPath) as? NovelCoverCell
            cell?.configure(with: self.covers[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
    }

    func update(with list: [NovelCover], animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, NovelCover>()
        snapshot.appendSections([.premiumStories])
        snapshot.appendItems(list, toSection: .premiumStories)
        dataSource.apply(snapshot, animatingDifferences: animate)
    }

    func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(Style.Home.collectionViewCellItemWidth),
                                                  heightDimension: .fractionalHeight(Style.Home.collectionViewCellItemFractionalHight))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = Style.Home.collectionViewItemContentInset
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Style.Home.collectionViewCellGroupFractionalWidth),
                                                   heightDimension: .absolute(Style.Home.collectionViewCellGroupHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }
    }
}
