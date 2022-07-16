//
//  DetailArticlesCollectionViewCell.swift
//  PlantApp
//
//  Created by APPLE on 16/07/22.
//

import UIKit

class DetailArticlesCollectionViewCell: UICollectionViewCell{
    static let identifier: String = String(describing: DetailArticlesCollectionViewCell.self)
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.text = "Even on Urban Excursions,Finding Mother Nature's Charms"
        view.font = .monospacedSystemFont(ofSize: 21, weight: .bold)
        view.textColor = .black

        return view
    }()
    
    lazy var avatar: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "avatar")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20.0
        view.clipsToBounds = true
        view.backgroundColor = .red
        
        return view
    }()
    
    lazy var profileNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.text = "Shylla Monic"
        view.font = .monospacedSystemFont(ofSize: 14, weight: .medium)
        view.textColor = .black

        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.text = "2019 . 01 . 01"
        view.font = .monospacedSystemFont(ofSize: 12, weight: .medium)
        view.textColor = .gray

        return view
    }()
    
    lazy var labelStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [profileNameLabel,dateLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 7.0
        
        return view
    }()
    
    lazy var followButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("+ Follow", for: .normal)
        view.contentMode = .scaleAspectFill
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        view.layer.cornerRadius = 15.0
        view.clipsToBounds = true
        view.backgroundColor = UIColor(named: "ic_color")
        view.tintColor = .white
//        view.addTarget(self, action: #selector(followTapped), for: .touchUpInside)
        
        return view
    }()
    
    lazy var profileStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [avatar,labelStack,followButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .leading
        view.axis = .horizontal
        view.spacing = 7.0
        
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.text = """
Public parks aside, getting a dose of nature can
be a tricky task during an urban escape. But nat
ure should and can fit into that city getaway, acc
ording to Kally Ellis, the founder of the London fl
orist company McQueens and the in-house florist
for the Maybourne Hotel Group. “Connecting with
the natural world wherever you are is a great antid
ote to jet lag and travel tiredness,” she said. “Plan
ts and flowers can refresh us, boost our energy
and help us recalibrate.”
"""
        view.font = .monospacedSystemFont(ofSize: 13, weight: .regular)
        view.textColor = .gray

        return view
    }()
    
        override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        self.addSubview(profileStack)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 80.0),
            
            profileStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20.0),
            profileStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileStack.heightAnchor.constraint(equalToConstant: 45.0),
            
            avatar.heightAnchor.constraint(equalToConstant: 40.0),
            avatar.widthAnchor.constraint(equalToConstant: 40.0),

            followButton.heightAnchor.constraint(equalToConstant: 30.0),
            followButton.widthAnchor.constraint(equalToConstant: 70.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: profileStack.bottomAnchor,constant: 10.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
