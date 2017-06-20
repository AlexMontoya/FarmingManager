//
//  CustomTabBarController.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 29/05/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        let mapping = HomeController(collectionViewLayout: layout)
        let homeNavController = UINavigationController(rootViewController: mapping)
        homeNavController.tabBarItem.title = "My Fields"
        //homeNavController.tabBarItem.image = UIImage(named: "champs")
        
        let vc = SensorListController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = "My Sensors"
        //navController.tabBarItem.image = UIImage(named: "sensor")
        
        let profile = SensorListController(collectionViewLayout: layout)
        let profileNavController = UINavigationController(rootViewController: profile)
        profileNavController.tabBarItem.title = "My Profile"
        
    viewControllers = [homeNavController, navController, profileNavController /*createMultipleNavControllerWithTitle(title: "My sensors")*/]
        
        
    }

    
    /*private func createMultipleNavControllerWithTitle(title: String /*imageName: String*/) -> UINavigationController {
        
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        //navController.tabBarItem.image = UIImage(name: ) -> Here the picto made by Marina :)
        return navController
    }*/
    


}

