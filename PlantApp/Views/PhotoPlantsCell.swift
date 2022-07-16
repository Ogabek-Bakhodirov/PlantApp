//
//  PhotoPlantsCell.swift
//  PlantApp
//
//  Created by user on 13/07/22.
//

import UIKit


class PhotoPlantsCell: UICollectionViewCell {
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "  #mini  "
        view.font = .monospacedSystemFont(ofSize: 10, weight: .medium)
        view.textColor = .black
        view.backgroundColor = Colors.mainBgColor.color
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        return view
    }()
    
    lazy var mainImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = (Int.random(in: 0...3) != 0) ? Images.mainPageflowerImage1.image : Images.mainPageflowerImage3.image
        view.contentMode = .scaleToFill
        
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
        self.addSubview(mainImage)
        self.addSubview(descriptionLabel)
        
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: self.topAnchor),
            mainImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -14),
        ])
    }
    
    
}
