//
//  TypePlantsCell.swift
//  PlantApp
//
//  Created by user on 13/07/22.
//

import UIKit

class TypePlantsCell: UICollectionViewCell {
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Home Plants"
        view.font = .monospacedSystemFont(ofSize: 21, weight: .bold)
        view.textColor = .white
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return view
    }()
    
   private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "102 Type Of Plants"
        view.font = .monospacedSystemFont(ofSize: 14, weight: .regular)
        view.textColor = .white
       view.setContentHuggingPriority(.defaultHigh, for: .vertical)
       
        return view
    }()
    
    private lazy var labelStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 4
        view.distribution = .fill
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }()
    
    lazy var mainImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.mainPagePlantImage.image
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
        self.addSubview(labelStack)
        
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: self.topAnchor),
            mainImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            labelStack.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 13),
            labelStack.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -18),
        ])
    }
   
    
}

