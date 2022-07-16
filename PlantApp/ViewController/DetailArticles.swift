//
//  DetailArticles.swift
//  PlantApp
//
//  Created by APPLE on 16/07/22.
//

import UIKit

class DetailArticles: UIViewController{
    var count = 0
    
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Rectangle")
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    lazy var backButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        view.contentMode = .scaleToFill
        view.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
//        view.frame.size = CGSize(width: 40.0, height: 40.0)
        view.tintColor = .white
        
        return view
    }()
    
    lazy var heartButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 31.0
        view.clipsToBounds = true
        view.backgroundColor = .red
        view.addTarget(self, action: #selector(heartTapped), for: .touchUpInside)
        view.tintColor = .white
        
        return view
    }()
    
    lazy var vegetablesLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "VEGETABLES"
        view.textAlignment = .center
        view.backgroundColor = UIColor(named: "vegetables_bg")
        view.font = .monospacedSystemFont(ofSize: 12, weight: .bold)
        view.textColor = UIColor(named: "vegetables_color")

        return view
    }()
    
    lazy var gardenLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "GARDEN"
        view.backgroundColor = UIColor(named: "vegetables_bg")
        view.textAlignment = .center
        view.font = .monospacedSystemFont(ofSize: 12, weight: .bold)
        view.textColor = UIColor(named: "vegetables_color")

        return view
    }()
    
    lazy var labelStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [vegetablesLabel,gardenLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 10.0
        
        return view
    }()
    
    lazy var detailArticlesCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(DetailArticlesCollectionViewCell.self, forCellWithReuseIdentifier: "DetailArticlesCollectionViewCell")
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSubviews()
    }
    
    @objc func backTapped(){
        dismiss(animated: true)
    }
    
    @objc func heartTapped(){
        count += 1
        if count % 2 == 1{
            heartButton.backgroundColor = .white
            heartButton.tintColor = .red
        }else{
            heartButton.backgroundColor = .red
            heartButton.tintColor = .white
        }
    }
    
    func createLayout()->UICollectionViewLayout{
        
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitem: item, count: 1)
//            group.contentInsets = .init(top: 3.0, leading: 3.0, bottom: 3.0, trailing: 3.0)
            return NSCollectionLayoutSection(group: group)
        }
    }
    
    func setSubviews(){
        
        view.addSubview(image)
        view.addSubview(backButton)
        view.addSubview(heartButton)
        view.addSubview(labelStack)
//        view.addSubview(uiView)
        view.addSubview(detailArticlesCollectionView)
        
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23.0),
            backButton.heightAnchor.constraint(equalToConstant: 50.0),
            backButton.widthAnchor.constraint(equalToConstant: 50.0),
            
            heartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 250.0),
            heartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23.0),
            heartButton.heightAnchor.constraint(equalToConstant: 60.0),
            heartButton.widthAnchor.constraint(equalToConstant: 60.0),
            
            labelStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25.0),
            labelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23.0),
            labelStack.heightAnchor.constraint(equalToConstant: 20.0),
            labelStack.widthAnchor.constraint(equalToConstant: 200.0),
            
//            uiView.topAnchor.constraint(equalTo: view.topAnchor, constant: 260.0),
//            uiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0),
//            uiView.heightAnchor.constraint(equalToConstant: 65.0),
//            uiView.widthAnchor.constraint(equalToConstant: 65.0),
//
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.34),
            
            detailArticlesCollectionView.topAnchor.constraint(equalTo: image.bottomAnchor,constant: 50.0),
            detailArticlesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 23.0),
            detailArticlesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -23.0),
            detailArticlesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension DetailArticles: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = detailArticlesCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailArticlesCollectionViewCell", for: indexPath) as? DetailArticlesCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        return cell
    }
    
}
