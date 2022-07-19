//
//  ProfileCollectionViewCell2.swift
//  PlantApp
//
//  Created by APPLE on 16/07/22.
//

import UIKit

class ProfileCell2: UICollectionViewCell{
    
    lazy var collectedLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Your Collected Plants"
        view.textColor = .black
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 17.0, weight: .bold)
        
        return view
    }()
    
    
    lazy var alagatreLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Alagatre Plant"
        view.textColor = .black
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 14.0, weight: .semibold)
        
        return view
    }()
    
    lazy var dotIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .topLeft
        view.image = UIImage(systemName: "circle.circle")
        view.tintColor = UIColor(named: "button_bg")
        
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
    
    lazy var stackView1: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dotIcon,alagatreLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 3.0
        
        return view
    }()
    
    lazy var stackView3: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 3.0
        
        return view
    }()
    
    lazy var stackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [collectedLabel,stackView1,stackView3])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 3.0
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            stackView2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView2.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView2.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            collectedLabel.heightAnchor.constraint(equalToConstant: 76.0),
            dateLabel.leadingAnchor.constraint(equalTo: stackView3.leadingAnchor,constant: 25.0),
            alagatreLabel.heightAnchor.constraint(equalToConstant: 20.0),
            dotIcon.widthAnchor.constraint(equalToConstant: 24.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
