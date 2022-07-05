//
//  OnboardingViewController.swift
//  PlantApp
//
//  Created by Eldorbek on 05/07/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "ic_onboarding_identify")

        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Identify Plants"
        view.font = .systemFont(ofSize: 19.0, weight: .bold)
        view.textColor = UIColor(named: "main_title_color")
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        view.textAlignment = .center

        return view
    }()

    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "You can identify the plants you don't know through your camera"
        view.numberOfLines = 3
        view.minimumScaleFactor = 0.7
        view.contentMode = .top
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 13.0, weight: .regular)
        view.textColor = UIColor(named: "main_title_color")
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
        view.image = UIImage(named: "ic_dots_1")
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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "main_bg")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(contentStack)

        NSLayoutConstraint.activate([
            mainImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60.0),
            mainImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60.0),
            mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor),

            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            contentStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0),
            contentStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20.0),
//            contentStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
}
