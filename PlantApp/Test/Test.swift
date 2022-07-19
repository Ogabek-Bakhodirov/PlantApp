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
        view.text = "Hello World"
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
        navigationController?.present(test2, animated: true)
    }
}


class Test2: UIViewController{
    
    lazy var textField: UITextField = {
       let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
    }
    
}
