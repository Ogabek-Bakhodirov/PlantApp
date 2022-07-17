//
//  OnboardingView.swift
//  PlantApp
//
//  Created by eldorbek nusratov on 17/07/22.
//

import UIKit

class OnboardingView: UIView {
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
        view.text = Strings.identifyPageTitleLabel.value
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
        view.text = Strings.identifyPageDescription.value
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

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        self.addSubview(contentStack)
        self.addSubview(nextButton)

        NSLayoutConstraint.activate([
            mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 60.0),
            mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -60.0),
            mainImageView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor),

            contentStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            contentStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0),
            contentStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20.0),

            nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -65.0),
            nextButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0),
            nextButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20.0),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

