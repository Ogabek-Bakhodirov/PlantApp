//
//  CollectionViewControler.swift
//  PlantApp
//
//  Created by Eldorbek on 13/07/22.
//

import UIKit

class CollectionViewControler: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: createLayout2())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(TestCollectionItemCell.self, forCellWithReuseIdentifier: TestCollectionItemCell.cellName)
        view.register(HeaderView.self, forSupplementaryViewOfKind: "HeaderView", withReuseIdentifier: "HeaderView")

        view.delegate = self
        view.dataSource = self

        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(section: createSection())
    }

    func createSection() -> NSCollectionLayoutSection {
        let singleItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)
            )
        )
        singleItem.contentInsets = .init(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)

        let doubletItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        doubletItem.contentInsets = .init(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)

        let doubletGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)),
            subitem: doubletItem,
            count: 2
        )

        let topGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/3)),
            subitems: [singleItem, doubletGroup]
        )

        let tripletItem = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        tripletItem.contentInsets = .init(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)

        let tripletGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)),
            subitem: tripletItem,
            count: 3
        )

        let mainGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)),
            subitems: [topGroup, tripletGroup]
        )

        mainGroup.contentInsets = .init(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)

        let layout = NSCollectionLayoutSection(group: mainGroup)
        layout.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100.0)), elementKind: "HeaderView", alignment: .top)]

        return layout
    }

    func createLayout2() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { sectionId, _ in
            if sectionId == 0 {
                let section = self.createSection()
                section.orthogonalScrollingBehavior = .groupPaging
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalHeight(1), heightDimension: .fractionalHeight(1)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30.0)), elementKind: "HeaderView", alignment: .topLeading)]

                return section
            }
        }
    }
}

extension CollectionViewControler: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        13
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCollectionItemCell.cellName, for: indexPath) as? TestCollectionItemCell else {
            return UICollectionViewCell()
        }

        cell.backgroundColor = .red

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: "HeaderView", withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView else {
            return UICollectionReusableView()
        }

        header.label.textColor = .yellow
        if indexPath.section == 0 {
            header.label.text = "Header 1"
        } else {
            header.label.text = "Header 2"
        }

        return header
    }

}

class HeaderView: UICollectionReusableView {
    lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Salom"


        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor),
            label.rightAnchor.constraint(equalTo: rightAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
