//
//  LoginPageViewController2.swift
//  PlantApp
//
//  Created by user on 07/07/22.
//

import UIKit

struct User {
    var name: String
    var password: String
}

class LoginPageViewController2: UIViewController {
    
    private lazy var labelsStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [mainLabel,descriptionLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .fill
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }()
    
    private lazy var mainLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Strings.loginPageTitleLabel.value
        view.textColor = Colors.mainTitleColor.color
        view.font = UIFont(name: "'SF Pro Text'", size: 30.0)
        view.font = .systemFont(ofSize: 30.0, weight: .bold)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }()
    private lazy var descriptionLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Strings.loginPageDescription.value
        view.textColor = Colors.mainSubtitleColor.color
        view.font = .systemFont(ofSize: 16.0, weight: .regular)
        view.font = UIFont(name: "'SF Pro Text'", size: 16.0)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }()
    
    //MARK: - TextField && TextField's Image  with label
    
    private lazy var mainStack: UIStackView = {
        var view = UIStackView(arrangedSubviews:[
            labelsStack,
            nameTextFieldStack,
            passwordTextFieldStack,
            mainCheckboxStack,
            
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 29
        view.distribution = .fill
        return view
    }()
    
    private lazy var nameTextFieldStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [nameTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var nameTextField: CustomTextField = {
        var view = CustomTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextFieldStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [passwordTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillProportionally
        return view
    }()
    
    
    private lazy var passwordTextField: CustomTextField = {
        var view = CustomTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel.text = "Password"
        view.textField.isSecureTextEntry = true
        return view
    }()
    //MARK: - Checkbox and login Button
    
    private lazy var mainCheckboxStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [secondCheckboxStack,forgotPasswordButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 25
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var secondCheckboxStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [checkbox,checkboxTitle])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fill
        return view
    }()
    
    private lazy var checkbox: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 15).isActive = true
        view.widthAnchor.constraint(equalToConstant: 15).isActive = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(buttonChecked), for: .touchUpInside)
        return view
    }()
    
    private lazy var checkboxTitle: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Remember me"
        view.textColor = Colors.mainSubtitleColor.color
        view.font = .systemFont(ofSize: 11.0, weight: .regular)
        return view
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Forgot Password?", for: .normal)
        view.setTitleColor(Colors.mainSubtitleColor.color, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .medium)
        view.layer.borderWidth = 0.0
        view.contentHorizontalAlignment = .right
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Login", for: .normal)
        view.backgroundColor = Colors.onboardingBtnColor.color
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        view.contentHorizontalAlignment = .center
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return view
    }()
    
    //MARK: - accaunt views //
    
    private lazy var accauntStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [accauntLabel,signUpButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fill
        return view
    }()
    
    private lazy var accauntLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Don’t Have Account?"
        view.textColor = Colors.mainSubtitleColor.color
        view.font = .systemFont(ofSize: 11.0, weight: .regular)
        view.textAlignment = .right
        return view
    }()
    
    private lazy var signUpButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(Colors.onboardingBtnColor.color, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
        view.layer.borderWidth = 0.0
        view.backgroundColor = .clear
        view.contentHorizontalAlignment = .left
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.mainBgColor.color
        setupSubview()
    }
    
    private func setupSubview() {
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "";
        self.navigationController?.navigationBar.tintColor = Colors.mainSubtitleColor.color
        view.addSubview(mainStack)
        view.addSubview(accauntStack)
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            
            mainStack.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant: 15),
            mainStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            mainStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            mainStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40),
            nameTextFieldStack.topAnchor.constraint(equalTo: labelsStack.bottomAnchor, constant: 42),
            passwordTextFieldStack.topAnchor.constraint(equalTo: nameTextFieldStack.bottomAnchor, constant: 42), loginButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor,constant: 40),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            accauntStack.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 22),
            accauntStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    @objc private func buttonChecked() {
        if checkbox.currentImage == UIImage.init(systemName: "checkmark" ){
            checkbox.setImage(nil, for: .normal)
        } else {
            checkbox.setImage(.init(systemName: "checkmark"), for: .normal)
        }
        
    }
    
    @objc func loginButtonTapped() {
        if let name = nameTextField.text , !name.isEmpty, let password = passwordTextField.text, !password.isEmpty {
            let user = User(name: name, password: password)
            UserDefaults.standard.set(user.name, forKey: "USER_NAME")
            UserDefaults.standard.set(user.password, forKey: "USER_PASSWORD")
            UserDefaults.standard.set(true, forKey: "IS_USER_LOGIN")

            let controller = TabbarController()
            navigationController?.pushViewController(controller, animated: true)

        } else {
            showAlert()
        }
        
    }
    func showAlert() {
        let alert = UIAlertController(title: "Eror", message: "please check the checkbox and write somethink", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
