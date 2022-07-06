//
//  FirstScreenViewController.swift
//  PlantApp
//
//  Created by APPLE on 06/07/22.
//

import UIKit

class FirstScreenViewController: UINavigationController{
    
    lazy var helloLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello"
        view.font = .systemFont(ofSize: 30.0, weight: .bold)
        view.textColor = UIColor(named: "main_title_color")
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Let’s Learn More About Plants"
        view.font = .systemFont(ofSize: 16.0, weight: .regular)
        view.textColor = .gray
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var usernameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Username"
        view.font = .systemFont(ofSize: 12.0, weight: .medium)
        view.textColor = .gray
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var usernameTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "Taylor Swift"
        view.textColor = .black
        
        return view
    }()
    
    lazy var checkUsernameIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "username_check")
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var usernameStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [usernameTextfield,checkUsernameIcon])
        view.axis = .horizontal
    }()
    
    lazy var passwordTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "password"
        view.textColor = .gray
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupSubviews(){
        view.addSubview(<#T##view: UIView##UIView#>)
        
    }
}
