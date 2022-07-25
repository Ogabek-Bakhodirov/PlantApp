//
//  ArticlesRatingTableViewCell.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 25/07/22.
//

import UIKit

class ArticlesRatingTableViewCell: UITableViewCell{
    
    static let cellName = String(describing: ArticlesRatingTableViewCell.self)

    lazy var articleTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Circle Cactus"
        view.textColor = #colorLiteral(red: 0.2117647059, green: 0.2705882353, blue: 0.3529411765, alpha: 1)
        view.font = UIFont(name:"HelveticaNeue-Bold", size: 27.0)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        return view
    }()
    
    lazy var starAmount: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "4.1"
        view.textColor = #colorLiteral(red: 0.2117647059, green: 0.2705882353, blue: 0.3529411765, alpha: 1)
        view.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return view
    }()
    
    lazy var starsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [makeStar(), makeStar(), makeStar(), makeStar(), makeStar(false)])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 4
        view.axis = .horizontal
        view.distribution = .fillEqually
        
        let contentView = UIStackView(arrangedSubviews: [view, starAmount])
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.distribution = .fillProportionally
        
        return contentView
    }()
    
    lazy var plantKingdom: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "KINGDOM"
        view.font = UIFont(name: "SFProText-Semibold", size: 14)
        view.textColor = #colorLiteral(red: 0.2862745098, green: 0.3333333333, blue: 0.4, alpha: 1)
        
        return view
    }()
    
    lazy var plantKingdomName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Plantae"
        view.font = .systemFont(ofSize: 14, weight: .regular)
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
        view.font = UIFont(name: "SFProText-Semibold", size: 14)
        view.textColor = #colorLiteral(red: 0.2862745098, green: 0.3333333333, blue: 0.4, alpha: 1)
        
        return view
    }()
    
    lazy var plantFamilyName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Cactaceae"
        view.font = .systemFont(ofSize: 14, weight: .regular)
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
        view.spacing = 15
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
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
        self.addSubview(articleTitle)
        self.addSubview(starsStackView)
        self.addSubview(plantTypeStack)
        
        NSLayoutConstraint.activate([
            articleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            articleTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            starsStackView.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 15),
            starsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            starsStackView.heightAnchor.constraint(equalToConstant: 15),
            
            plantTypeStack.topAnchor.constraint(equalTo: starsStackView.bottomAnchor, constant: 15),
            plantTypeStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            plantTypeStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func makeStar(_ isActive: Bool = true) -> UIImageView{
        let star = UIImageView()
        star.image = UIImage(systemName: "star.fill")
        if isActive == true{
            star.tintColor = #colorLiteral(red: 1, green: 0.8319619298, blue: 0, alpha: 1)
        } else {
            star.tintColor = #colorLiteral(red: 0.3764705882, green: 0.3764705882, blue: 0.3764705882, alpha: 0.3)
        }
        
        return star
    }
}
