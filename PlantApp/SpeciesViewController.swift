//
//  SpeciesViewController.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 08/07/22.
//

import UIKit

class SpeciesViewController: UIViewController{
    
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"]
    
    let plantName = ["CACTUS", "CISTUS", "CAESALPENIA", "CINNAMOUM", "CIRSIUM", "CISSUS"]
    
    
    lazy var backgroundTopImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = Images.speciesPage_bg_img
        
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
        view.setImage(Images.kebab_menu_img, for: .normal)
        
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
        view.register(SpeciesTableViewCell.self, forCellReuseIdentifier: "SpeciesTableViewCell")
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
            backgroundTopImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundTopImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundTopImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            speciesBackButton.topAnchor.constraint(equalTo: backgroundTopImage.topAnchor, constant: 29),
            speciesBackButton.leftAnchor.constraint(equalTo: backgroundTopImage.leftAnchor, constant: 20),
            speciesBackButton.heightAnchor.constraint(equalToConstant: 24),
            speciesBackButton.widthAnchor.constraint(equalToConstant: 24),
            
            speciesMenuButton.topAnchor.constraint(equalTo: backgroundTopImage.topAnchor, constant: 29),
            speciesMenuButton.rightAnchor.constraint(equalTo: backgroundTopImage.rightAnchor, constant: -20),
            speciesMenuButton.heightAnchor.constraint(equalToConstant: 24),
            speciesMenuButton.widthAnchor.constraint(equalToConstant: 24),
            
            speciesTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            speciesTitle.leftAnchor.constraint(equalTo: backgroundTopImage.leftAnchor, constant: 20),
            speciesTitle.bottomAnchor.constraint(equalTo: backgroundTopImage.bottomAnchor, constant: 45),
            
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
}

extension SpeciesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let listPlantViewController = ListPlantViewController()
        listPlantViewController.modalTransitionStyle = .crossDissolve
        listPlantViewController.modalPresentationStyle = .fullScreen
        present(listPlantViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "A"
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        tableView.sectionIndexColor = #colorLiteral(red: 0.4156862745, green: 0.4352941176, blue: 0.4901960784, alpha: 1)
        return alphabet
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return alphabet.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plantName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpeciesTableViewCell") as? SpeciesTableViewCell else { return UITableViewCell() } 
        
        cell.selectionStyle = .none
        cell.speciesLabel.text = plantName[indexPath.row]
        
        return cell
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
