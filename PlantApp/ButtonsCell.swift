//
//  ButtonsCell.swift
//  PlantApp
//
//  Created by user on 13/07/22.
//
import UIKit
class ButtonsCell: UICollectionViewCell {
    
    lazy var buttonView: UIView = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews(){
        self.addSubview(buttonView)
        self.addSubview(buttonLabel)
        self.addSubview(buttonImage)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: self.topAnchor),
            buttonView.leftAnchor.constraint(equalTo: self.leftAnchor),
            buttonView.rightAnchor.constraint(equalTo: self.rightAnchor),
            buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonLabel.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -10),
            buttonLabel.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            
            buttonImage.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 10),
            buttonImage.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            buttonImage.heightAnchor.constraint(equalToConstant: 25),
            buttonImage.widthAnchor.constraint(equalToConstant: 30),
            
            button.topAnchor.constraint(equalTo: buttonView.topAnchor),
            button.leftAnchor.constraint(equalTo: buttonView.leftAnchor),
            button.rightAnchor.constraint(equalTo: buttonView.rightAnchor),
            button.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor),
        ])
    }
    
    @objc func buttonTapped(on button: UIButton){
        print("Tapped")
    }
    
}
