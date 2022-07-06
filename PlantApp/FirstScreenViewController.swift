//
//  FirstScreenViewController.swift
//  PlantApp
//
//  Created by APPLE on 06/07/22.
//

import UIKit

class FirstScreenViewController: UINavigationController{
    
    lazy var helloLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello"
        view.font = .systemFont(ofSize: 30.0, weight: .bold)
        view.textColor = UIColor(named: "main_title_color")
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Let’s Learn More About Plants"
        view.font = .systemFont(ofSize: 16.0, weight: .regular)
        view.textColor = .gray
        view.textAlignment = .left
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupSubviews(){
        view.addSubview(<#T##view: UIView##UIView#>)
        
    }
}
