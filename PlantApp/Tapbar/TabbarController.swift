//
//  TabbarController.swift
//  PlantApp
//
//  Created by Bekzod Qahhorov on 19/07/22.

import SETabView
import UIKit

class TabbarController: SETabViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        addViewController()
    }

    private func addViewController() {
        let controller1 = MainViewController()
        controller1.tabBarItem.image = UIImage.init(systemName: "house.fill")
        controller1.tabBarItem.title = "Home"

        let controller2 = FirstScreenViewController()
        controller2.tabBarItem.image = UIImage.init(systemName: "person.fill")
        controller2.tabBarItem.title = "Home 2"
        viewControllers = [
            controller1, controller2
        ]
        setTabColors(backgroundColor: UIColor.white,
                     ballColor: (Colors.onboardingBtnColor.color ?? UIColor.darkGray), 
                     tintColor: UIColor.white, 
                     unselectedItemTintColor: UIColor.black, 
                     barTintColor: .yellow)
        
        setViewControllers(viewControllers)
    }
}
