//
//  SpeciesTableViewCell.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 08/07/22.
//

import UIKit

class SpeciesTableViewCell: UITableViewCell{
    static let identifier: String = String(describing: SpeciesTableViewCell.self)

    lazy var speciesLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.contentMode = .left
        view.textColor = Colors.spaciesPagetextColor

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

