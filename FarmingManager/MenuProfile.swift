//
//  MenuProfile.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 23/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

class MenuProfile: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 235, green: 240, blue: 245)
        return cv
    }()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
