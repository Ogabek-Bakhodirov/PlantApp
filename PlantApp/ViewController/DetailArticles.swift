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

    lazy var heartButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.heart_img.image, for: .normal)
        view.tintColor = .white
//        view.addTarget(self, action: #selector(heartButtonTapped(on:)), for: .touchUpInside)        
        return view
    }()

    
    lazy var heartView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 0.3843137255, blue: 0.3843137255, alpha: 1)
        view.layer.cornerRadius = 30
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 5
        
        return view
    }()
    
    lazy var vegetablesLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "VEGETABLES"
        view.textAlignment = .center
        view.backgroundColor = UIColor(named: "vegetables_bg")
        view.font = .systemFont(ofSize: 12, weight: .bold)
        view.textColor = UIColor(named: "vegetables_color")
        view.layer.cornerRadius = 5
        view.clipsToBounds = true

        return view
    }()
    
    lazy var gardenLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "GARDEN"
        view.backgroundColor = UIColor(named: "vegetables_bg")
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 12, weight: .bold)
        view.textColor = UIColor(named: "vegetables_color")
        view.layer.cornerRadius = 5
        view.clipsToBounds = true

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

            return NSCollectionLayoutSection(group: group)
        }
    }
    
    func setSubviews(){
        
        view.addSubview(image)
        view.addSubview(heartView)
        view.addSubview(heartButton)
        view.addSubview(labelStack)
        view.addSubview(detailArticlesCollectionView)
        
        NSLayoutConstraint.activate([

            heartView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -30),
            heartView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            heartView.heightAnchor.constraint(equalToConstant: 60),
            heartView.widthAnchor.constraint(equalTo: heartView.heightAnchor),

            heartButton.centerXAnchor.constraint(equalTo: heartView.centerXAnchor),
            heartButton.centerYAnchor.constraint(equalTo: heartView.centerYAnchor),    
            heartButton.heightAnchor.constraint(equalToConstant: 40),
            heartButton.widthAnchor.constraint(equalTo: heartButton.heightAnchor),

            
            labelStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25.0),
            labelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23.0),
            labelStack.heightAnchor.constraint(equalToConstant: 20.0),
            labelStack.widthAnchor.constraint(equalToConstant: 200.0),
   
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileViewController = ProfileViewController()
        profileViewController.modalTransitionStyle = .crossDissolve
        profileViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
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
