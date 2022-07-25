//
//  ArticlesTopTableViewCell.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 25/07/22.
//

import UIKit

class ArticlesTopTableViewCell: UITableViewCell{
    
    static let cellName = String(describing: ArticlesTopTableViewCell.self)
    
    lazy var backgroundTopImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.circleCactusBg
        
        return view
    }()
    
    lazy var speciesBackButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        view.tintColor = .white
//        view.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.5
        
        return view
    }()
    
    lazy var speciesMenuButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.kebab_menu_img, for: .normal)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.5
        
        return view
    }()
    
    lazy var heartButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.heart, for: .normal)
        view.tintColor = .white
//        view.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)        
        return view
    }()

    
    lazy var heartView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 0.3843137255, blue: 0.3843137255, alpha: 1)
        view.layer.cornerRadius = 30
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 5
        
        return view
    }()
    
    lazy var dangerTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "DANGER"
        view.textColor = #colorLiteral(red: 0.1843137255, green: 0.568627451, blue: 0.9215686275, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.568627451, blue: 0.9215686275, alpha: 0.1)
        view.font = UIFont(name:"HelveticaNeue-Bold", size: 12.0)
        view.textAlignment = .center
        view.layer.cornerRadius = 5
        view.clipsToBounds = true

        
        return view
    }()
    
    lazy var decorationTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "DECORATION"
        view.textColor = #colorLiteral(red: 0.1843137255, green: 0.568627451, blue: 0.9215686275, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.568627451, blue: 0.9215686275, alpha: 0.1)
        view.font = UIFont(name:"HelveticaNeue-Bold", size: 12.0)
        view.textAlignment = .center
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var dangerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dangerTitle, decorationTitle])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        addSubview(backgroundTopImage)
        addSubview(speciesBackButton)
        addSubview(speciesMenuButton)
        addSubview(heartView)
        addSubview(heartButton)
        addSubview(dangerStackView)
                
        NSLayoutConstraint.activate([
            backgroundTopImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundTopImage.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundTopImage.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundTopImage.heightAnchor.constraint(equalToConstant: 280),
            
            speciesBackButton.topAnchor.constraint(equalTo: backgroundTopImage.topAnchor, constant: 40),
            speciesBackButton.leftAnchor.constraint(equalTo: backgroundTopImage.leftAnchor, constant: 20),
            speciesBackButton.heightAnchor.constraint(equalToConstant: 24),
            speciesBackButton.widthAnchor.constraint(equalToConstant: 24),
            
            speciesMenuButton.topAnchor.constraint(equalTo: backgroundTopImage.topAnchor, constant: 40),
            speciesMenuButton.rightAnchor.constraint(equalTo: backgroundTopImage.rightAnchor, constant: -20),
            speciesMenuButton.heightAnchor.constraint(equalToConstant: 24),
            speciesMenuButton.widthAnchor.constraint(equalToConstant: 24),
            
            heartView.topAnchor.constraint(equalTo: backgroundTopImage.bottomAnchor, constant: -25),
            heartView.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            heartView.heightAnchor.constraint(equalToConstant: 60),
            heartView.widthAnchor.constraint(equalTo: heartView.heightAnchor),

            heartButton.centerXAnchor.constraint(equalTo: heartView.centerXAnchor),
            heartButton.centerYAnchor.constraint(equalTo: heartView.centerYAnchor),    
            heartButton.heightAnchor.constraint(equalToConstant: 40),
            heartButton.widthAnchor.constraint(equalTo: heartButton.heightAnchor),
            
            dangerStackView.topAnchor.constraint(equalTo: backgroundTopImage.bottomAnchor, constant: 25),
            dangerStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            dangerStackView.heightAnchor.constraint(equalToConstant: 25),
            dangerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dangerTitle.widthAnchor.constraint(equalToConstant: 78),
            decorationTitle.widthAnchor.constraint(equalToConstant: 108),
        ])
    }
}
