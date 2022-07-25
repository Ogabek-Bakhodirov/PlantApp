//
//  ArticlesTableView.swift
//  PlantApp
//
//  Created by Ogabek Bakhodirov on 25/07/22.
//

import UIKit

class ArticlesTableViewController: UIViewController{
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(ArticlesTopTableViewCell.self, forCellReuseIdentifier: ArticlesTopTableViewCell.cellName)
        view.register(ArticlesRatingTableViewCell.self, forCellReuseIdentifier: ArticlesRatingTableViewCell.cellName)
        view.register(ArticlesDescriptionTableViewCell.self, forCellReuseIdentifier: ArticlesDescriptionTableViewCell.cellName)
        
        return view
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupSubviews()
    }
    
    func setupSubviews(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)            
        ])
    }
}

extension ArticlesTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesTopTableViewCell.cellName, for: indexPath) as? ArticlesTopTableViewCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.row == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesRatingTableViewCell.cellName, for: indexPath) as? ArticlesRatingTableViewCell else { return UITableViewCell() }
            
            return cell
        } else if indexPath.row == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesDescriptionTableViewCell.cellName, for: indexPath) as? ArticlesDescriptionTableViewCell else { return UITableViewCell() }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

