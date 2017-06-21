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
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "My Profile"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        
        
    }
    
    
}


