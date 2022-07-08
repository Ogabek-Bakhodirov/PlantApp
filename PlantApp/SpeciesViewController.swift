//
//  SpeciesViewController.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 08/07/22.
//

import UIKit

class SpeciesViewController: UIViewController{
    
    lazy var backgroundTopImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "")
        
        return view
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
    }
}
