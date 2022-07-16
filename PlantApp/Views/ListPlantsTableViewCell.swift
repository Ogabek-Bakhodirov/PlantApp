//
//  ListPlantsTableViewCell.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 15/07/22.
//

import UIKit

class ListPlantsTableViewCell: UITableViewCell{
    
    lazy var plantImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.redCactus.image
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 6
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    lazy var plantName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Red Cactus"
        view.font = .systemFont(ofSize: 17, weight: .bold)
        view.textColor = #colorLiteral(red: 0.2725816071, green: 0.342954278, blue: 0.4284142256, alpha: 1)
        
        return view
    }()
    
    lazy var plantKingdom: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "KINGDOM"
        view.font = UIFont(name: "SFProText-Medium", size: 12)
        view.textColor = #colorLiteral(red: 0.631372549, green: 0.6588235294, blue: 0.7254901961, alpha: 1)
        
        return view
    }()
    
    lazy var plantKingdomName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Plantae"
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = #colorLiteral(red: 0.2725816071, green: 0.342954278, blue: 0.4284142256, alpha: 1)
        
        return view
    }()
    
    lazy var kingdomStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantKingdom, plantKingdomName])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        
        return view
    }()
    
    lazy var plantFamily: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "FAMILY"
        view.font = UIFont(name: "SFProText-Medium", size: 12)
        view.textColor = #colorLiteral(red: 0.631372549, green: 0.6588235294, blue: 0.7254901961, alpha: 1)
        
        return view
    }()
    
    lazy var plantFamilyName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Cactaceae"
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = #colorLiteral(red: 0.2725816071, green: 0.342954278, blue: 0.4284142256, alpha: 1)
        
        return view
    }()
    
    lazy var familyStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantFamily, plantFamilyName])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        
        return view
    }()
    
    lazy var plantTypeStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [kingdomStack, familyStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillProportionally
        
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Description"
        view.font = UIFont(name: "SFProText-Medium", size: 12)
        view.textColor = #colorLiteral(red: 0.631372549, green: 0.6588235294, blue: 0.7254901961, alpha: 1)
        
        return view
    }()
    
    lazy var descriptionText: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Cactus spines are produced from specialized structures..."
        view.numberOfLines = 2
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = #colorLiteral(red: 0.2862745098, green: 0.3333333333, blue: 0.4, alpha: 1)
        
        return view
    }()
    
    lazy var descriptionStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantName, plantTypeStack, descriptionLabel, descriptionText])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        addSubview(plantImage)
        addSubview(descriptionStack)
        
        NSLayoutConstraint.activate([
            plantImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            plantImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            plantImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            plantImage.heightAnchor.constraint(equalToConstant: 125),
            plantImage.widthAnchor.constraint(equalTo: plantImage.heightAnchor),
                        
            descriptionStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            descriptionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            descriptionStack.leftAnchor.constraint(equalTo: plantImage.rightAnchor, constant: 20),
            descriptionStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            plantImage.heightAnchor.constraint(equalToConstant: 125),

        ])
    }
    
}

