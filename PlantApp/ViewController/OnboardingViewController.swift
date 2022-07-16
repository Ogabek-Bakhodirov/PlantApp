//
//  OnboardingViewController.swift
//  PlantApp
//
//  Created by Eldorbek on 05/07/22.
//

import UIKit

enum Page {
    case identifyPage
    case learPage
    case readPage
}

class OnboardingViewController: UIViewController {
    private var pageNumber = 1
    private var page = Page.identifyPage
    
    lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = Images.identifyPageImage.image

        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Labels.identifyPageTitleLabel.label
        view.font = .systemFont(ofSize: 19.0, weight: .bold)
        view.textColor = Colors.mainTitleColor.color
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        view.textAlignment = .center

        return view
    }()

    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Labels.identifyPageDescription.label
        view.numberOfLines = 3
        view.minimumScaleFactor = 0.7
        view.contentMode = .top
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 13.0, weight: .regular)
        view.textColor = Colors.mainTitleColor.color
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        return view
    }()

    lazy var labelStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.contentMode = .center
        view.spacing = 10

        return view
    }()

    lazy var dotImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = Images.identifyPageDot.image
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        return view
    }()

    lazy var contentStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mainImageView, labelStackView, dotImageView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.contentMode = .center
        view.spacing = 40

        return view
    }()
    
    lazy var nextButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Next", for: .normal)
        view.backgroundColor = Colors.onboardingBtnColor.color
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(nextButtonTapped(on:)), for: .touchUpInside)

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.mainBgColor.color
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(contentStack)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            mainImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60.0),
            mainImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60.0),
            mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor),

            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            contentStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            contentStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),

            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65.0),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func nextButtonTapped(on: UIButton){
        pageNumber += 1
        
        switch pageNumber{
        case 1:
            page = Page.identifyPage
        case 2:
            page = Page.learPage
        case 3:
            page = Page.readPage
        default:
            let signUpViewController = LoginPageViewController2()
            signUpViewController.modalTransitionStyle = .crossDissolve
            signUpViewController.modalPresentationStyle = .fullScreen
            present(signUpViewController, animated: true)
        }
        
        changeMainPageElements()
    }
    
    private func changeMainPageElements(){
        switch page {
        case .identifyPage:
            print("1")
        case .learPage:
            mainImageView.image = Images.learnPageImage.image
            titleLabel.text = Labels.learnPageTitleLabel.label
            descriptionLabel.text = Labels.learnPageDescription.label
            dotImageView.image = Images.learnPageDot.image
        case .readPage:
            mainImageView.image = Images.readPageImage.image
            titleLabel.text = Labels.readPageTitleLabel.label
            descriptionLabel.text = Labels.readPageDescription.label
            dotImageView.image = Images.readPageDot.image
            nextButton.setTitle("Sign up", for: .normal)
        }
    }
}
