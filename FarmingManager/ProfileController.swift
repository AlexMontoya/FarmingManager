//
//  ProfileController.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 20/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = UIColor.rgb(red: 235, green: 240, blue: 245)
        collectionView?.contentInset = UIEdgeInsets(top: 160, left: 0, bottom: 0, right: 0)
        
        setupProfileMenu()
    }
    
    let menuProfile: MenuProfile = {
        let mp = MenuProfile()
        return mp
    }()
    
    private func setupProfileMenu() {
        
        view.addSubview(menuProfile)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuProfile)
        view.addConstraintsWithFormat(format: "V:|[v0(200)]", views: menuProfile)
        
        
    }
    
}


