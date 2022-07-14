//
//  SpeciesTableViewCell.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 08/07/22.
//

import UIKit

class SpeciesTableViewCell: UITableViewCell{
    
    lazy var speciesLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Colors.spaciesPagetextColor
        view.contentMode = .left
        
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .systemGray6
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        addSubview(speciesLabel)
        
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            speciesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
        ])
    }
}

