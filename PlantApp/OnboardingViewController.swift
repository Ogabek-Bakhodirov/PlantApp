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
var page = Page.identifyPage
var pageNumber = 1

class OnboardingViewController: UIViewController {

    lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = K.OnboardingImages.identifyPageImage

        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = K.TitleLabels.identifyPageTitleLabel
        view.font = .systemFont(ofSize: 19.0, weight: .bold)
        view.textColor = K.Colors.mainTitleColor
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        view.textAlignment = .center

        return view
    }()

    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = K.DescriptionLabels.identifyPageDescription
        view.numberOfLines = 3
        view.minimumScaleFactor = 0.7
        view.contentMode = .top
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 13.0, weight: .regular)
        view.textColor = K.Colors.mainTitleColor
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
        view.image = K.DotImages.identifyPageDot
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
        view.backgroundColor = K.Colors.onboardingBtnColor
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(nextButtonTapped(on:)), for: .touchUpInside)

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = K.Colors.mainBgColor
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
//            contentStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
            
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
            let signUpViewController = SignUpViewController()
            signUpViewController.modalTransitionStyle = .crossDissolve
            signUpViewController.modalPresentationStyle = .fullScreen
            present(signUpViewController, animated: true)
        }
        
        changeMainPageElements()
    }
    
    func changeMainPageElements(){
        switch page {
        case .identifyPage:
            print("1")
        case .learPage:
            mainImageView.image = K.OnboardingImages.learnPageImage
            titleLabel.text = K.TitleLabels.learnPageTitleLabel
            descriptionLabel.text = K.DescriptionLabels.learnPageDescription
            dotImageView.image = K.DotImages.learnPageDot
        case .readPage:
            mainImageView.image = K.OnboardingImages.readPageImage
            titleLabel.text = K.TitleLabels.readPageTitleLabel
            descriptionLabel.text = K.DescriptionLabels.readPageDescription
            dotImageView.image = K.DotImages.readPageDot
            nextButton.setTitle("Sign up", for: .normal)
        }
    }
}
