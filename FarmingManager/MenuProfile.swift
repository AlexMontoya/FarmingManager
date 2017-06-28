//
//  MenuProfile.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 23/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

class MenuProfile: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
            lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
                cv.dataSource = self
                cv.delegate = self
                return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        collectionView.register(profileCell.self, forCellWithReuseIdentifier: cellId)
        
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        cell.setGradientBackground(colorOne: UIColor.rgb(red: 80, green: 167, blue: 194), colorTwo: UIColor.rgb(red: 147, green: 219, blue: 210))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width , height: frame.height)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    
    class profileCell: BaseCell {
    
        let profileImageView: UIImageView = {
        let imageView = UIImageView()
            imageView.image = UIImage(named: "Mathias")
            imageView.layer.cornerRadius = 40
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill

            return imageView
            
        }()
    
        let profileName: UILabel = {
        let label = UILabel()
            label.text = "Mathias Benoist"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = UIColor.white
            label.textAlignment = .center
            return label
        }()
        
        let actionButton: UIButton = {
        let button = UIButton(type: .roundedRect)
            button.setTitle("MODIFY ALERTS", for: .normal)
            button.setTitleColor(UIColor.rgb(red: 80, green: 167, blue: 194), for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 10
            return button
        }()
        
    
        override func setupViews(){
            super.setupViews()
            
            addSubview(profileImageView)
            addSubview(profileName)
            addSubview(actionButton)
            
            addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            addConstraint(NSLayoutConstraint(item: profileName, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            addConstraint(NSLayoutConstraint(item: actionButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            
            addConstraintsWithFormat(format: "H:[v0(80)]", views: profileImageView)
            addConstraintsWithFormat(format: "V:|-10-[v0(80)]-20-[v1(20)]-10-[v2(20)]", views: profileImageView, profileName, actionButton)
            
            addConstraintsWithFormat(format: "H:[v0(200)]", views: profileName)
            
            addConstraintsWithFormat(format: "H:[v0(200)]", views: actionButton)
            
            
        }
        
        
    }
    
    
}


