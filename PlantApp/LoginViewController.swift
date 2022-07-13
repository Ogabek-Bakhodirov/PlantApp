//
//  LoginViewController.swift
//  PlantApp
//
//  Created by APPLE on 06/07/22.
//

import UIKit

class LoginViewController: UIViewController{
    
    lazy var helloLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello  Bro "
        view.contentMode = .center
        view.font = .systemFont(ofSize: 30.0, weight: .bold)
        view.textColor = UIColor(named: "main_title_color")
        view.textAlignment = .left
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ic_color")
        setSubviews()
    }
    
    func setSubviews(){
        view.addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200.0),
            helloLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70.0),
            helloLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70.0),
            helloLabel.heightAnchor.constraint(equalToConstant: 50.0),
            helloLabel.widthAnchor.constraint(equalToConstant: 50.0),
        ])
    }
}
