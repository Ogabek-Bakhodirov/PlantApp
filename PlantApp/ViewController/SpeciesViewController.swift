//
//  SpeciesViewController.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 08/07/22.
//

import UIKit

struct Plant {
    var name: String
    var image: UIImage?
}

struct PlantGroup {
    let groupName: String
    var plants: [Plant] = []
}

// Loading data from remote/baza/storage

class SpeciesLoader {
    func loadSpeieces() -> [PlantGroup] {
        let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
        var plantsGroups: [PlantGroup] = []

        alphabet.forEach { name in
            var plantGroup = PlantGroup(groupName: name)
            let images = [Images.redCactus.image, Images.fatCactus.image, Images.circleCactus.image]

            let plant1 = Plant(name: name + "ABSDFEGD 1", image: images[0])
            let plant2 = Plant(name: name + "ABSDFEGD 2", image: images[1])
            let plant3 = Plant(name: name + "ABSDFEGD 3", image: images[2])

            plantGroup.plants = [plant1, plant2, plant3]

            plantsGroups.append(plantGroup)
        }

        return plantsGroups
    }
}



class SpeciesViewController: UIViewController{
    var loader: SpeciesLoader?
    var plantsGroups: [PlantGroup] = []

    
    lazy var backgroundTopImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.speciesPage_bg_img.image
        
        return view
    }()
    
    lazy var speciesBackButton: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        view.tintColor = .white
        
        return view
    }()
    
    lazy var speciesMenuButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(Images.kebab_menu_img.image, for: .normal)
        
        return view
    }()
    
    lazy var speciesTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Species"
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
        view.register(SpeciesTableViewCell.self, forCellReuseIdentifier: SpeciesTableViewCell.identifier)
        view.separatorStyle = .none
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupSubviews()

        loadData()
    }

    func loadData() {

        if let loader = loader {
            plantsGroups = loader.loadSpeieces()
            speciesTableView.reloadData()
        }

        speciesTableView.reloadData()
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
            
            speciesTableView.topAnchor.constraint(equalTo: backgroundTopImage.bottomAnchor, constant: 30),
            speciesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            speciesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),            
            speciesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30), 
        ])
    }
}

extension SpeciesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let listPlantViewController = ListPlantsViewController()
        listPlantViewController.plants = plantsGroups[indexPath.section].plants
        listPlantViewController.modalTransitionStyle = .crossDissolve
        listPlantViewController.modalPresentationStyle = .fullScreen
        present(listPlantViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        
        let label = UILabel()
        label.textColor = Colors.onboardingBtnColor.color
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = plantsGroups[section].groupName
        label.frame = CGRect(x: 25, y: 0, width: 20, height: 15)
        
        headerView.addSubview(label)
            
        return headerView
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        tableView.sectionIndexColor = #colorLiteral(red: 0.4156862745, green: 0.4352941176, blue: 0.4901960784, alpha: 1)
        let plantNames = plantsGroups.map { $0.groupName }

        return plantNames
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return plantsGroups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plantsGroups[section].plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpeciesTableViewCell.identifier) as? SpeciesTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.speciesLabel.text = plantsGroups[indexPath.section].plants[indexPath.row].name
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return plantsGroups[section].groupName
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
