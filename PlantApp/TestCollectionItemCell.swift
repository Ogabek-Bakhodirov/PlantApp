//
//  TestCollectionItemCell.swift
//  PlantApp
//
//  Created by Eldorbek on 07/07/22.
//

import Foundation
import UIKit

class TestCollectionItemCell: UICollectionViewCell {
    static let cellName: String = String(describing: TestCollectionItemCell.self)

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Title"
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        return view
    }()

    lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Sub Title"

        return view
    }()

    lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 5.0
        view.axis = .vertical

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
        addSubview(contentStackView)

        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.leftAnchor.constraint(equalTo: leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: rightAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
