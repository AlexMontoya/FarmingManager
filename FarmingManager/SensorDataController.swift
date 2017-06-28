//
//  PictureController.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 02/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

let cellId = "cellId"
let weatherCellId = "weatherCellId"

class SensorDataController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false

        
        setupCollectionView()
        setupMenuBar()
        
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as?
            UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.rgb(red: 235, green: 240, blue: 245)
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(WeatherCell.self, forCellWithReuseIdentifier: weatherCellId)
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView?.isPagingEnabled = true
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.sensorDataController = self
        return mb
    }()
    
    private func setupMenuBar() {
        
        let turquoiseView = UIView()
        turquoiseView.backgroundColor = UIColor.rgb(red: 235, green: 240, blue: 245)
        
        view.addSubview(turquoiseView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: turquoiseView)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: turquoiseView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
        
    }
    
    //Here don't forget to add an another cell the crop stages view
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: weatherCellId, for: indexPath)
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 98)
    }
    
    
}


