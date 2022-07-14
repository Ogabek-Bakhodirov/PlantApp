//
//  ListPlantViewController.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 10/07/22.
//

import UIKit

class ListPlantsViewController: UIViewController{
    
    let plantImages = [Images.redCactus, Images.fatCactus, Images.circleCactus]
    let plantNames = ["Red Cactus", "Fat Cactus", "Circle Cactus"]
        
    lazy var backgroundTopImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.listPlantsBackground
        
        return view
    }()
    
    lazy var speciesBackButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        view.tintColor = .white
        view.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return view
    }()
    
    lazy var speciesMenuButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.kebab_menu_img, for: .normal)
        
        return view
    }()
    
    lazy var speciesTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Cactus"
        view.textColor = .white
        view.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        
        return view
    }()
    
    lazy var searchBar: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Search For Species"
        view.backgroundColor = .white
        view.tintColor = .black
        view.layer.cornerRadius = 20
        
        view.setLeftPaddingPoints(30)
        
        return view
    }()
    
    lazy var speciesTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(ListPlantsTableViewCell.self, forCellReuseIdentifier: "listPlantsTableViewCell")
        view.separatorStyle = .none
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupSubviews()
    }
    
    func setupSubviews(){
        view.addSubview(backgroundTopImage)
        view.addSubview(speciesBackButton)
        view.addSubview(speciesMenuButton)
        view.addSubview(speciesTitle)
        view.addSubview(speciesTableView)
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            backgroundTopImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundTopImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundTopImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            speciesBackButton.topAnchor.constraint(equalTo: backgroundTopImage.topAnchor, constant: 50),
            speciesBackButton.leftAnchor.constraint(equalTo: backgroundTopImage.leftAnchor, constant: 20),
            speciesBackButton.heightAnchor.constraint(equalToConstant: 24),
            speciesBackButton.widthAnchor.constraint(equalToConstant: 24),
            
            speciesMenuButton.topAnchor.constraint(equalTo: backgroundTopImage.topAnchor, constant: 50),
            speciesMenuButton.rightAnchor.constraint(equalTo: backgroundTopImage.rightAnchor, constant: -20),
            speciesMenuButton.heightAnchor.constraint(equalToConstant: 24),
            speciesMenuButton.widthAnchor.constraint(equalToConstant: 24),
            
            speciesTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            speciesTitle.leftAnchor.constraint(equalTo: backgroundTopImage.leftAnchor, constant: 20),
            speciesTitle.bottomAnchor.constraint(equalTo: backgroundTopImage.bottomAnchor, constant: 25),
            
            searchBar.topAnchor.constraint(equalTo: backgroundTopImage.bottomAnchor, constant: -33),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            speciesTableView.topAnchor.constraint(equalTo: backgroundTopImage.bottomAnchor),
            speciesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            speciesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),            
            speciesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30), 
        ])
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }
}

extension ListPlantsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listPlantsTableViewCell") as? ListPlantsTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .systemGray6
        cell.plantImage.image = plantImages[indexPath.row]
        cell.plantName.text = plantNames[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plantImages.count
    }
    
}
