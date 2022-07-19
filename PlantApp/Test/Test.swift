//
//  Test.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 19/07/22.
//

import UIKit

class Test: UIViewController{
    
    lazy var titleLabel: UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "something"
        view.textColor = .black
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var image: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.identifyPageImage.image
        view.contentMode = .center
        
        return view
    }()
    
    lazy var button: UIButton = {
       let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Push it", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        view.contentMode = .center
        view.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        setupSubview()
    }
    
    func setupSubview(){
        view.addSubview(titleLabel)
        view.addSubview(image)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            image.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            image.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            
            button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
        ])
    }
    
    @objc func buttonTapped(){
        let test2 = Test2()
        test2.modalTransitionStyle = .crossDissolve
        test2.modalPresentationStyle = .fullScreen
//        present(test2, animated: true)
        navigationController?.pushViewController(test2, animated: true)
    }
}

//MARK: - Test2

class Test2: UIViewController{
    
    let buttonImages = [
        Images.mainPageflowerImage1.image, 
        Images.mainPageflowerImage2.image,
        Images.mainPageflowerImage3.image,
        Images.redCactus.image
    ]
    
    lazy var buttons = [makeButton(0), makeButton(1), makeButton(2), makeButton(3)]
    
    lazy var textField: UITextField = {
       let view = UITextField()
       view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.text = "Write smth"
        
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: buttons)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 5
        return view
    }()
    
    lazy var button: UIButton = {
       let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Done", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        view.contentMode = .center
        view.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        setupSubview()
    }
    
    func setupSubview(){
        view.addSubview(textField)
        view.addSubview(buttonStackView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            buttonStackView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            buttonStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func makeButton(_ index: Int = 0) -> UIButton{
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(buttonImages[index], for: .normal)
        view.contentMode = .center
        view.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
         
         return view
    }
    
    @objc func imageButtonTapped(){
        buttons.enumerated().forEach { $1.setImage(buttonImages[$0], for: .normal) }
        
        let vc = navigationController?.viewControllers[0]
    }
    
    @objc func doneButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
}

