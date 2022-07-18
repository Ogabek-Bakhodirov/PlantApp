//
//  File.swift
//  PlantApp
//
//  Created by eldorbek nusratov on 17/07/22.
//

import SETabView
import UIKit

class TabbarController: SETabViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        addViewController()
    }

    private func addViewController() {
        let controller1 = MainViewController()
        controller1.tabBarItem.image = UIImage.init(systemName: "homekit")
        controller1.tabBarItem.title = "Home"

        let controller2 = FirstScreenViewController()
        controller2.tabBarItem.image = UIImage.init(systemName: "homekit")
        controller2.tabBarItem.title = "Home 2"
        viewControllers = [
            controller1, controller2
        ]
        setTabColors(backgroundColor: UIColor.secondarySystemBackground, ballColor: UIColor.red, tintColor: UIColor.black, unselectedItemTintColor: UIColor.red, barTintColor: .clear)
        setViewControllers(viewControllers)
    }
}
