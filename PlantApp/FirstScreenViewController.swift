//
//  FirstScreenViewController.swift
//  PlantApp
//
//  Created by APPLE on 06/07/22.
//

import UIKit

class FirstScreenViewController: UINavigationController{
    
    var count = 0
    
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
//        view.inactiveColor = UIColor.gray
//        view.activeColor = UIColor(named: "ic_color")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Taylor Swift"
        view.textColor = .black

        return view
    }()
    
//    lazy var lineView: UIView = {
//        let view = UIView()
//        view.backgroundColor = changeLineColor(usernameTextfield.text ?? "")
//
//        return view
//    }()
    
    lazy var checkUsernameIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "username_check")
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var usernameStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [usernameTextfield,checkUsernameIcon])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        
        return view
    }()
    
    lazy var passwordTextfield: UITextField = {
        let view = UITextField()
//        view.activeColor = UIColor(named: "ic_color")
//        view.inactiveColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Password"
        view.textColor = .gray

        return view
    }()
    
    lazy var checkUsernameIcon2: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "username_check")
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var passwordStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [passwordTextfield,checkUsernameIcon2])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        
        return view
    }()
    
//    lazy var lineView2: UIView = {
//        let view = UIView()
//        view.backgroundColor = .gray
//
//        return view
//    }()
    
    lazy var textfieldStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [usernameStack,passwordStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 10.0
        
        return view
    }()

    lazy var checkRememberButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "space_box"), for: .normal)
        button.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        button.backgroundColor = .clear
        
        return button
    }()

    lazy var rememberLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Remember me"
        view.font = .systemFont(ofSize: 11.0, weight: .regular)
        view.textColor = .gray
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var forgotButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Forgot Password?", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 11.0, weight: .medium)
        view.setTitleColor(UIColor.gray, for: .normal)
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var infoStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [checkRememberButton,rememberLabel,forgotButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 2.0
        
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("LOGIN", for: .normal)
        view.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        view.layer.cornerRadius = 5.0
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = UIColor(named: "ic_color")
        
        return view
    }()
    
    lazy var accountLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Don’t Have Account?"
        view.font = .systemFont(ofSize: 12.0, weight: .regular)
        view.textColor = .gray
        view.textAlignment = .right
        
        return view
    }()
    
    lazy var signUpButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Sign Up", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .regular)
        view.setTitleColor(UIColor.green, for: .normal)
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var signStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [accountLabel,signUpButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
//        view.distribution = .fillEqually
        view.center = self.view.center
        view.spacing = 1.0
        
        return view
    }()
    
    lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [helloLabel,subtitleLabel,usernameLabel,textfieldStack,infoStack,loginButton,signStack])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
//        view.distribution = .fillEqually
        view.spacing = 16.0
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "main_bg")
        navigationItem.backButtonTitle = " "
        setupSubviews()
        
    }
    
    func setupSubviews(){
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 95.0),
            contentStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23.0),
            contentStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23.0),
            contentStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50),
            
//            lineView2.bottomAnchor.constraint(equalTo: textfieldStack.bottomAnchor, constant: -150.0),
            
            signStack.rightAnchor.constraint(equalTo: contentStackView.rightAnchor, constant: -70.0),
            
            signStack.heightAnchor.constraint(equalToConstant: 10.0),
            
//            lineView.heightAnchor.constraint(equalToConstant: 2.0),
//            lineView2.heightAnchor.constraint(equalToConstant: 2.0),
            
            checkRememberButton.heightAnchor.constraint(equalTo: infoStack.heightAnchor, multiplier: 0.23),
            checkRememberButton.widthAnchor.constraint(equalToConstant: 15.0),
            
            usernameTextfield.heightAnchor.constraint(equalToConstant: 30.0),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 30.0),
            
            subtitleLabel.heightAnchor.constraint(equalToConstant: 25.0),
            usernameLabel.heightAnchor.constraint(equalToConstant: 35.0),
            
            helloLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            checkUsernameIcon.heightAnchor.constraint(equalToConstant: 20.0),
            checkUsernameIcon.widthAnchor.constraint(equalToConstant: 20.0),
            usernameStack.heightAnchor.constraint(equalToConstant: 40.0),
            
            checkUsernameIcon2.heightAnchor.constraint(equalToConstant: 20.0),
            checkUsernameIcon2.widthAnchor.constraint(equalToConstant: 20.0),
            
            infoStack.heightAnchor.constraint(equalToConstant: 60.0),
            
            loginButton.heightAnchor.constraint(equalToConstant: 45.0)
        ])
    }
    
    @objc func checkboxTapped(){
        count += 1
        if count % 2 == 1{
        checkRememberButton.setImage(UIImage(named: "checked"), for: .normal)
        }else{
            checkRememberButton.setImage(UIImage(named: "space_box"), for: .normal)
        }
    }
    
    @objc func loginPressed(){
        let viewController = LoginViewController()
        viewController.modalTransitionStyle = .flipHorizontal
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
//    func changeCheckIcon()->UIImage {
//        if usernameTextfield.inactiveColor == UIColor.gray{
//            return UIImage(named: "space_box") ?? UIImage(named: "space_box")!
//        }else if usernameTextfield.activeColor == UIColor(named: "ic_color"){
//            return UIImage(named: "username_check") ?? UIImage(named: "space_box")!
//        }
//        return UIImage(named: "space_box") ?? UIImage(named: "space_box")!
//    }
    
//    func changeLineColor(_ text: String)->UIColor{
//        if usernameTextfield.text != ""{
//            guard let color = UIColor(named: "ic_color") else { return UIColor.gray }
//            return color
//        }else{
//            let color = UIColor.gray
//            return color
//        }
//    }
}

//extension FirstScreenViewController {
//        open override func awakeFromNib() {
//            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        }
//}
