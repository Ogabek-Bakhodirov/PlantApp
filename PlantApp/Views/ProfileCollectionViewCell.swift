//
//  ProfileCollectionViewCell.swift
//  PlantApp
//
//  Created by APPLE on 16/07/22.
//

import UIKit


class ProfileCollectionViewCell: UICollectionViewCell{
    
    lazy var collectionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "ARTICLES"
        view.textAlignment = .center
        view.backgroundColor = .clear
        view.font = .monospacedSystemFont(ofSize: 16, weight: .medium)
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .clear
        view.textColor = .gray

        return view
    }()
    
    lazy var uiView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 10.0
        
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(uiView)
        self.addSubview(collectionLabel)
        
        NSLayoutConstraint.activate([
            collectionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            collectionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionLabel.heightAnchor.constraint(equalToConstant: 25),
            
            uiView.topAnchor.constraint(equalTo: self.topAnchor),
            uiView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            uiView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            uiView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            uiView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

