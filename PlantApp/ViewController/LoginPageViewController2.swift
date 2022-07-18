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
    
    private lazy var backButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.setImage( .init(systemName: "chevron.backward"), for: .normal)
        view.tintColor = Colors.mainSubtitleColor.color
        view.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return view
    }()
    
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
        var view = UIStackView(arrangedSubviews: [nameTextField,textFiledsImage])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Username"
//        view.placeholderFont = .systemFont(ofSize: 14)
        view.textColor = Colors.mainTitleColor.color
//        view.selectedTitleColor = Colors1.onboardingBtnColor.color!
//        view.selectedL/ineColor = Colors1.onboardingBtnColor.color!
//        view.selectedLineHeight = 1.0
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        view.errorColor = .red
        view.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return view
    }()
    private lazy var textFiledsImage: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = .init(systemName: "checkmark")
        view.tintColor = Colors.mainBgColor.color
        view.widthAnchor.constraint(equalToConstant: 14).isActive = true
        return view
    }()
    
    private lazy var passwordTextFieldStack: UIStackView = {
        var view = UIStackView(arrangedSubviews: [passwordTextField,textFiledsImage2])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillProportionally
        return view
    }()
    
    
    private lazy var passwordTextField: UITextField = {
        var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "password"
        view.textColor = Colors.mainTitleColor.color
//        view.selectedTitleColor = Colors.onboardingBtnColor.color!
//        view.selectedLineColor = Colors.onboardingBtnColor.color!
//        view.selectedLineHeight = 1.0
//        view.placeholderFont = .systemFont(ofSize: 12)
//        view.font = .systemFont(ofSize: 16, weight: .bold)
//        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        view.errorColor = .red
        view.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        return view
    }()

    private lazy var textFiledsImage2: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = .init(systemName: "checkmark")
        view.tintColor = Colors.mainBgColor.color
        view.widthAnchor.constraint(equalToConstant: 14).isActive = true
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
        view.layer.borderWidth = 2
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
        view.addSubview(backButton)
        view.addSubview(mainStack)
        view.addSubview(accauntStack)
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            mainStack.topAnchor.constraint(equalTo:backButton.bottomAnchor,constant: 35),
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
        if let name = nameTextField.text, !name.isEmpty, let password = passwordTextField.text, !password.isEmpty {
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
    @objc func textFieldDidChange(_ textfield: UITextField) {
            if let text = nameTextField.text {
                if let floatingLabelTextField = nameTextField as? UITextField {
                    if text.isEmpty {
//                        floatingLabelTextField.errorMessage = "Invalid name"
                    }
                    else {
//                        floatingLabelTextField.errorMessage = nil
//                        textFiledsImage.tintColor = Colors.onboardingBtnColor.color
//                        floatingLabelTextField.errorMessage = "Please write your name"
                    }
                }
            }
        }
    
    @objc func passwordTextFieldChanged(_ textfield: UITextField) {
            if let text = passwordTextField.text {
                if let floatingLabelTextField = passwordTextField as? UITextField {
                    if text.count < 10 {
//                        floatingLabelTextField.errorMessage = "Invalid password"
                    }
                    else if text.count > 10 {
//                        floatingLabelTextField.errorMessage = nil
//                        textFiledsImage2.tintColor = Colors.onboardingBtnColor.color
//                        floatingLabelTextField.lineColor = Colors.onboardingBtnColor.color!
                    }
                }
            }
        }
    
    @objc private func backButtonTapped() {
        self.dismiss(animated: true)
    }
}
