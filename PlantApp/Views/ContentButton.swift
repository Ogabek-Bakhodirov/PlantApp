//
//  ContentButton.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 07/07/22.
//

import UIKit

class ContentButton: UIViewController{
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1742218435, green: 0.8692209125, blue: 0.6429886222, alpha: 1)
        view.layer.cornerRadius = 10
        
        
        view.layer.shadowOffset = CGSize(width: 1.0,
                                         height: 1.0)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = #colorLiteral(red: 0.1742218435, green: 0.8692209125, blue: 0.6429886222, alpha: 1)

        return view
    }()
    
    lazy var buttonImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "camera.fill")
        view.backgroundColor = .clear
        view.tintColor = .white
        
        return view
    }()
    
    lazy var buttonLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Identify"
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textColor = .white
        return view
    }()
    
    lazy var button: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(buttonTapped(on:)), for: .touchUpInside)        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSubviews()
    }
    
    func setupSubviews(){
        view.addSubview(contentView)
        view.addSubview(buttonLabel)
        view.addSubview(buttonImage)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            contentView.heightAnchor.constraint(equalToConstant: 100),
            contentView.widthAnchor.constraint(equalToConstant: 150),
            
            buttonLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            buttonLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            buttonImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            buttonImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonImage.heightAnchor.constraint(equalToConstant: 25),
            buttonImage.widthAnchor.constraint(equalToConstant: 30),
            
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    @objc func buttonTapped(on button: UIButton){
        print("Tapped")
    }
}
