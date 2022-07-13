//
//  SpeciesTableViewCell.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 08/07/22.
//

import UIKit

class SpeciesTableViewCell: UITableViewCell{
    
    lazy var speciesButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("A", for: .normal)
        view.setTitleColor(Colors.spaciesPagetextColor, for: .normal)
        view.backgroundColor = .clear
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
        addSubview(speciesButton)
        
        NSLayoutConstraint.activate([
            speciesButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            speciesButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
        ])
    }
}

