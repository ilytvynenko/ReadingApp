import UIKit

extension HomeViewController {
    enum Section: CaseIterable {
        case premiumStories
    }

    func makeDataSource() -> UICollectionViewDiffableDataSource<Section, NovelCover> {
        let dataSource = UICollectionViewDiffableDataSource<Section, NovelCover>(collectionView: collectionView) { collectionView, indexPath, novelCover in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.Utility.novelCoverCellID, for: indexPath) as? NovelCoverCell
            cell?.configure(with: self.covers[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
        let headerRegistration = UICollectionView.SupplementaryRegistration
            <HomeSectionHeader>(elementKind: UICollectionView.elementKindSectionHeader) { _,_,_ in}
        dataSource.supplementaryViewProvider = { supplementaryView, elementKind, indexPath in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
        return dataSource
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
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Style.Home.collectionViewHeaderFractionalWidth),
                                                          heightDimension: .absolute(Style.Home.categoryTitleViewHeight))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                            elementKind: UICollectionView.elementKindSectionHeader,
                                                                            alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        }
    }
}
