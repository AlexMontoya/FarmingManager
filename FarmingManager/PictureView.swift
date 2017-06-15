//
//  MenuNavView.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 12/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(CropImageView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: CropImageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: CropImageView)
        
    }
    
    
    let CropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "2:06-perpendiculaire")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
}


