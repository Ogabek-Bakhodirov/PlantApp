//
//  TestViewController.swift
//  PlantApp
//
//  Created by eldorbek nusratov on 16/07/22.
//

import UIKit

class TestViewController: UIViewController {
    private lazy var textField: CustomTextField = {
        let view = CustomTextField(frame: .zero)
        view.lengthCount = 1
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var textField2: CustomTextField = {
        let view = CustomTextField(frame: .zero)
        view.lengthCount = 6
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(textField2)

        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 70.0),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150.0),

            textField2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            textField2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            textField2.heightAnchor.constraint(equalToConstant: 70.0),
            textField2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40.0)
        ])
    }
}


