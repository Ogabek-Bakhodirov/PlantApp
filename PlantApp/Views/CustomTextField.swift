//
//  CustomTextField.swift
//  PlantApp
//
//  Created by eldorbek nusratov on 16/07/22.
//

import UIKit

class CustomTextField: UIView {
    var title = "Username"
    var lengthCount: Int = 6
   lazy var text = textField.text
    
     lazy var titleLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = title
        view.minimumScaleFactor = 0.5
        view.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        view.textColor = .systemGray2
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.isHidden = true

        return view
    }()

     lazy var textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        view.textColor = .black
        view.delegate = self
        view.attributedPlaceholder = placeHolderAttributesString

        return view
    }()

     lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray2

        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.learnPageImage.image

        return view
    }()

    private var placeHolderAttributesString: NSAttributedString {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray2,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0, weight: .medium)
        ]

        return NSAttributedString(string: title, attributes: attributes)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
        validate(with: textField.text!)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(textField)
        self.addSubview(lineView)
        self.addSubview(iconImageView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: textField.topAnchor),

            textField.leftAnchor.constraint(equalTo: self.leftAnchor),
            textField.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -5.0),

            iconImageView.leftAnchor.constraint(equalTo: textField.rightAnchor),
            iconImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 14.0),
            iconImageView.widthAnchor.constraint(equalToConstant: 18.0),

            lineView.leftAnchor.constraint(equalTo: self.leftAnchor),
            lineView.rightAnchor.constraint(equalTo: self.rightAnchor),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        titleLabel.isHidden = false
        textField.attributedPlaceholder = nil
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        titleLabel.isHidden = (textField.text?.isEmpty ?? true) ? true : false
        textField.attributedPlaceholder = placeHolderAttributesString
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            var string = textField.text!
            string.removeLast()
            validate(with: string)
        } else {
            validate(with: textField.text! + string)
        }

        return true
    }

    private func validate(with string: String) {
        if string.count > lengthCount {
            
            lineView.backgroundColor = .green
            iconImageView.image = Images.ic_check_green.image
        } else {
            lineView.backgroundColor = .systemGray2
            iconImageView.image = nil
        }
    }
}
