//
//  ArticlesDescriptionTableViewCell.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 25/07/22.
//

import UIKit

class ArticlesDescriptionTableViewCell: UITableViewCell{
    
    static let cellName = String(describing: ArticlesDescriptionTableViewCell.self)
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "DESCRIPTION"
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.textColor = #colorLiteral(red: 0.2862745098, green: 0.3333333333, blue: 0.4, alpha: 1)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        return view
    }()
    
    lazy var descriptionText: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = " The word 'cactus' derives, through Latin, from the Ancient Greek κάκτος, kaktos, a name originally used by Theophrastus for a spiny plant whose identity is not certain. Cacti occur in a wide range of shapes and sizes. Most cacti live in habitats subject to at least some drought. Theophrastus for a spiny plant whose identity is not certain. Cacti occur in a wide range of shapes and sizes. Most cacti live in habitats subject to at least some drought."
        view.numberOfLines = 0
        view.minimumContentSizeCategory = .medium
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textColor = #colorLiteral(red: 0.2862745098, green: 0.3333333333, blue: 0.4, alpha: 1)
        view.contentMode = .top
    
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        
        self.addSubview(descriptionLabel)
        self.addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            descriptionText.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            descriptionText.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            descriptionText.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),

        ])
    }
}
