//
//  MainCell.swift
//  PlantApp
//
//  Created by user on 13/07/22.
//

import UIKit

class MainCell: UICollectionViewCell {
    var name: String {
        return UserDefaults.standard.string(forKey: "USER_NAME") ?? ""
    }

  lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello \(name)"
        view.font = .monospacedSystemFont(ofSize: 21, weight: .bold)
        view.textColor = .white
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }()
    
   private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Strings.loginPageDescription.value
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
    lazy var searchBar: UITextField = {
       let view = UITextField()
      let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.leftViewMode = .always
        view.leftView = paddingView
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Search For Plants "
        view.textColor = .black
        view.font = .monospacedSystemFont(ofSize: 14, weight: .regular)
        view.backgroundColor = .white
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
            searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor ,constant: 5),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
}
