//
//  MainViewController.swift
//  PlantApp
//
//  Created by user on 10/07/22.
//

import UIKit

class MainViewController: UIViewController {
    var name: String {
        return UserDefaults.standard.string(forKey: "USER_NAME") ?? ""
    }

    lazy var mainLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text =  "hello \(name)"
        view.textColor = Colors.mainTitleColor.color
        view.font = UIFont(name: "'SF Pro Text'", size: 30.0)
        view.font = .systemFont(ofSize: 30.0, weight: .bold)
        //        view.heightAnchor.constraint(equalToConstant: 30.0)
        return view
    }()
    
    private lazy var contectCollectionView: UICollectionView = {
        var view = UICollectionView(frame: .zero, collectionViewLayout: setupLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"UICollectionViewCell")
        view.register(MainCell.self,forCellWithReuseIdentifier: "MainCell")
        view.register(ButtonsCell.self,forCellWithReuseIdentifier: "ButtonsCell")
        view.register(Header.self, forSupplementaryViewOfKind: "firstHeaderId", withReuseIdentifier: "Header")
        view.register(TypePlantsCell.self,forCellWithReuseIdentifier: "TypePlantsCell")
        view.register(PhotoPlantsCell.self,forCellWithReuseIdentifier: "PhotoPlantsCell")
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupSubViews()
    }
    
    func setupSubViews() {
        view.addSubview(contectCollectionView)
        NSLayoutConstraint.activate([
            contectCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            contectCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contectCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contectCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    //MARK: - Setup composition layout
    private func setupLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            if sectionIndex == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                item.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.29)), subitem: item, count: 1)
                return NSCollectionLayoutSection(group: group)
            }
            else if sectionIndex == 1 {
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .absolute(105),
                    heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 23
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(105)), subitem: item, count: 3)
                group.contentInsets = .init(top: 35, leading: 23, bottom: 0, trailing: 0.0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.bottom = 23
                return section
            } else if sectionIndex == 2{
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 23
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                    widthDimension: .fractionalWidth(0.8),
                    heightDimension: .fractionalHeight(0.3)), subitem: item, count: 1)
                group.contentInsets = .init(top: 15, leading: 23, bottom: 0, trailing: 0.0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.bottom = 25
                let header: NSCollectionLayoutBoundarySupplementaryItem = .init(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(30)),
                    elementKind: "firstHeaderId",
                    alignment: .topLeading)
                section.boundarySupplementaryItems = [header]
                return section
            } else  {
                let item = NSCollectionLayoutItem(layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
                //                item.contentInsets.trailing = 23
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                    widthDimension: .fractionalWidth(0.4),
                    heightDimension: .fractionalHeight(0.28)), subitem: item, count: 1)
                group.contentInsets = .init(top: 35, leading: 17, bottom: 0, trailing: 0.0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                let header: NSCollectionLayoutBoundarySupplementaryItem = .init(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(30)),
                    elementKind: "firstHeaderId",
                    alignment: .topLeading)
                section.boundarySupplementaryItems = [header]
                
                return section
            }
        }
        return layout
    }
}

//MARK: - Extension for MainVC inheretance protocol for collection View
extension MainViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 3
        }  else if section == 3 {
            return 6
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            switch indexPath.item {
            case 0:
                break
            case 1:
                let vc = SpeciesViewController()
                vc.loader = SpeciesLoader()
                vc.modalTransitionStyle = .flipHorizontal
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
                break
            case 2:
                break
            default:
                break
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"MainCell" , for: indexPath) as? MainCell else {
                let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"UICollectionViewCell" , for: indexPath)
                cell.backgroundColor = .red
                return cell
            }
            return cell
        } else  if indexPath.section == 2 {
            guard let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"TypePlantsCell" , for: indexPath) as? TypePlantsCell else {
                let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"UICollectionViewCell" , for: indexPath)
                cell.backgroundColor = .red
                return cell
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"ButtonsCell" , for: indexPath) as? ButtonsCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if indexPath.section == 3 {
            guard let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"PhotoPlantsCell" , for: indexPath) as? PhotoPlantsCell else {
                let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"UICollectionViewCell" , for: indexPath)
                cell.backgroundColor = .red
                return cell
            }
            return cell
        }
        
        else  {
            let cell = contectCollectionView.dequeueReusableCell(withReuseIdentifier:"UICollectionViewCell" , for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 2 {
            guard let supplementary = contectCollectionView.dequeueReusableSupplementaryView(ofKind: "firstHeaderId", withReuseIdentifier: "Header", for: indexPath) as? Header else{
                return UICollectionReusableView()
            }
            supplementary.label.text = "Plant Types"
            return supplementary
        } else if indexPath.section == 3 {
            guard let supplementary = contectCollectionView.dequeueReusableSupplementaryView(ofKind: "firstHeaderId", withReuseIdentifier: "Header", for: indexPath) as? Header else{
                return UICollectionReusableView()
            }
            supplementary.label.text = "Photography"
            return supplementary
        } else {
            return UICollectionReusableView()
        }
        
    }
}

class Header: UICollectionReusableView {
    
    lazy var label: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = .monospacedDigitSystemFont(ofSize: 17, weight: .bold)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 23),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

