//
//  ProfilePhotoCell.swift
//  PlantApp
//
//  Created by APPLE on 17/07/22.
//

import UIKit

class ProfilePhotoCell: UICollectionViewCell{
    
    lazy var photo: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill 
        view.backgroundColor = .white
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(photo)
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubviews(){
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: self.topAnchor),
            photo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
}
