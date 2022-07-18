//
//  OnboardingViewController.swift
//  PlantApp
//
//  Created by Eldorbek on 05/07/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    private enum Page {
        case identifyPage
        case learPage
        case readPage
    }

    private var page = Page.identifyPage
    
    lazy var contentView: OnboardingView = {
        let view = OnboardingView()
        view.translatesAutoresizingMaskIntoConstraints = false

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
        view.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        contentView.nextButton.addTarget(self, action: #selector(nextButtonTapped(on:)), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped(on: UIButton){
        moveNextPage()
        changeMainPageElements()
    }

    private func moveNextPage() {
        switch page {
        case .identifyPage: page = .learPage
        case .learPage: page = .readPage
        case .readPage: openLoginPageViewController()
        }
    }

    private func openLoginPageViewController() {
        let signUpViewController = LoginPageViewController2()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    private func changeMainPageElements(){
        switch page {
        case .identifyPage:
            break
        case .learPage:
            contentView.mainImageView.image = Images.learnPageImage.image
            contentView.titleLabel.text = Strings.learnPageTitleLabel.value
            contentView.descriptionLabel.text = Strings.learnPageDescription.value
            contentView.dotImageView.image = Images.learnPageDot.image
        case .readPage:
            contentView.mainImageView.image = Images.readPageImage.image
            contentView.titleLabel.text = Strings.readPageTitleLabel.value
            contentView.descriptionLabel.text = Strings.readPageDescription.value
            contentView.dotImageView.image = Images.readPageDot.image
            contentView.nextButton.setTitle("Sign up", for: .normal)
        }
    }
}
