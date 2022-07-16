//
//  MainCell.swift
//  PlantApp
//
//  Created by user on 13/07/22.
//

import UIKit

class MainCell: UICollectionViewCell {
    
  lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello"
        view.font = .monospacedSystemFont(ofSize: 21, weight: .bold)
        view.textColor = .white
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }()
    
   private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Labels.loginPageDescription.label
        view.font = .monospacedSystemFont(ofSize: 14, weight: .regular)
        view.textColor = .white
       
        return view
    }()
    
    private lazy var labelStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 4
        view.distribution = .fill
        return view
    }()
    
    
    lazy var userImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.mainPageUserPhoto.image
        view.contentMode = .scaleAspectFit
        return view
    }()
    lazy var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.mainPageBackgroundImage.image
        view.contentMode = .scaleToFill
        view.backgroundColor = .clear
        view.tintColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Search For Plants "
        view.searchTextField.textColor = .black
        view.searchTextField.font = .monospacedSystemFont(ofSize: 14, weight: .regular)
        view.barTintColor = .white
        view.searchTextField.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        
        return view
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        self.addSubview(backgroundImage)
        self.addSubview(labelStack)
        self.addSubview(userImage)
        self.addSubview(searchBar)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            labelStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelStack.leftAnchor.constraint(equalTo: self.leftAnchor ,constant: 23),
            
            userImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userImage.leftAnchor.constraint(equalTo: labelStack.rightAnchor,constant: 23),
            userImage.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -23),
            userImage.heightAnchor.constraint(equalToConstant: 50),
            
            
            searchBar.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 23),
            searchBar.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -23),
            searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
}
