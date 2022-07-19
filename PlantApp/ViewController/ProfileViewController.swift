//
//  ProfileViewController.swift
//  PlantApp
//
//  Created by APPLE on 16/07/22.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = ProfileCollectionViewCell()
//
//        if indexPath.item == 0{
//
//        }
//    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }else if section == 1{
            return 1
        }else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            guard let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else{
                return UICollectionViewCell()
            }
            if indexPath.item == 0{
                cell.collectionLabel.text = "ARTICLES"
            }else if indexPath.item == 1{
                cell.collectionLabel.text = "SPECIES"
                cell.collectionLabel.textColor = .white
                cell.uiView.backgroundColor = UIColor(named: "button_bg")
            }else if indexPath.item == 2{
                cell.collectionLabel.text = "LIKES"
            }
            return cell
        }else if indexPath.section == 1{
            guard let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell2", for: indexPath) as? ProfileCell2 else{
                return UICollectionViewCell()
        }
            return cell
        }else {
            guard let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfilePhotoCell", for: indexPath) as? ProfilePhotoCell else{
                return UICollectionViewCell()
        }
            if indexPath.item == 0{
                cell.photo.image = UIImage(named: "flower_1")
            }else if indexPath.item == 1{
                cell.photo.image = UIImage(named: "flower_2")
            }else{
                cell.photo.image = UIImage(named: "flower_3")
            }
            return cell
        }
    }
    
    lazy var profileCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        view.register(ProfileCell2.self, forCellWithReuseIdentifier: "ProfileCell2")
        view.register(ProfilePhotoCell.self, forCellWithReuseIdentifier: "ProfilePhotoCell")
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    func createLayout() -> UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            if sectionIndex == 0{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 5.0
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/20)), subitem: item, count: 3)
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            }else if sectionIndex == 1{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/10)), subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            }else {
                let singleItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
                singleItem.contentInsets.trailing = 10.0
                singleItem.contentInsets.top = 10.0
                let doubleItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
                doubleItem.contentInsets.top = 10.0
                let doubleGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)), subitem: doubleItem, count: 2)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(14/20)), subitems: [singleItem,doubleGroup])
                group.contentInsets = .init(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0)
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        return layout
    }
    
    lazy var backGroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "profile_bg")
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .topLeft
        view.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        view.tintColor = .white
        
        return view
    }()
    
    lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ic_userPhoto")
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.tintColor = .blue
        
        return view
    }()
    
    lazy var edtIconButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "kebab_menu_img"), for: .normal)
        view.tintColor = .white
        
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Taylor Swift"
        view.textColor = .white
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 23.0, weight: .bold)
        
        return view
    }()
    
    
    lazy var locationNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Los Angeles, California"
        view.textColor = .white
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 14.0, weight: .medium)
        
        return view
    }()
    
    lazy var locationIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .right
        view.image = UIImage(systemName: "mappin.circle.fill")
        view.tintColor = .white
        
        return view
    }()
    
    lazy var stackView1: UIStackView = {
        let view = UIStackView(arrangedSubviews: [locationIcon,locationNameLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 3.0
        
        return view
    }()
    
    lazy var stackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameLabel,stackView1])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSubviews()
    }
    
    func setSubviews(){
        
        view.addSubview(backGroundImage)
        view.addSubview(stackView2)
        view.addSubview(backButton)
        view.addSubview(avatarImageView)
        view.addSubview(edtIconButton)
        view.addSubview(profileCollectionView)
        
        NSLayoutConstraint.activate([
            
            backGroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.31),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5.0),
            backButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10.0),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            edtIconButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5.0),
            edtIconButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10.0),
            edtIconButton.heightAnchor.constraint(equalToConstant: 30),
            edtIconButton.widthAnchor.constraint(equalToConstant: 30),
            
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15.0),
            avatarImageView.rightAnchor.constraint(equalTo: edtIconButton.leftAnchor, constant: -100.0),
            avatarImageView.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 100.0),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            stackView2.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            stackView2.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20),
            stackView2.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20),
            stackView2.bottomAnchor.constraint(equalTo: backGroundImage.bottomAnchor,constant: -5.0),
            locationNameLabel.widthAnchor.constraint(equalTo: stackView2.widthAnchor, multiplier: 0.7),
            
            profileCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -23.0),
            profileCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 23.0),
            profileCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileCollectionView.topAnchor.constraint(equalTo: backGroundImage.bottomAnchor, constant: 20.0),
        ])
        view.layoutIfNeeded()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.clipsToBounds = true
    }
}
