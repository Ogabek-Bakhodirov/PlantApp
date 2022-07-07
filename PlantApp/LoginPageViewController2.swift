//
//  LoginPageViewController2.swift
//  PlantApp
//
//  Created by user on 07/07/22.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    private lazy var labelsStack: UIStackView = {
        var view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fill
        return view
    }()
        
    private lazy var mainLabel: UILabel = {
        var view = UILabel()
        view.text = K.TitleLabels.loginPageTitleLabel
        view.textColor = K.Colors.mainTitleColor
        view.font = .systemFont(ofSize: 30.0, weight: .bold)
        view.font = UIFont(name: "'SF Pro Text'", size: 30.0)
        return view
    }()
    private lazy var subtitleLabel: UILabel = {
        var view = UILabel()
        view.text = K.SubtitleLabels.loginPageSubtitleLabel
        view.textColor = K.Colors.mainSubtitleColor
        view.font = .systemFont(ofSize: 30.0, weight: .bold)
        view.font = UIFont(name: "'SF Pro Text'", size: 30.0)
        return view
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
