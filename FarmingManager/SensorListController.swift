//
//  SensorListController.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 30/05/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

class SensorListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var images: [Image] = {
     
        var dSchool1 = Image()
        dSchool1.thumbnailImageName = "2:06-perpendiculaire"
        
        var dSchool2 = Image()
        dSchool2.thumbnailImageName = "2:06-sud"
        
        return [dSchool1, dSchool2]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Sensors"
        navigationController?.navigationBar.isTranslucent = false
        
        /*let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "My Sensors"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = titleLabel*/
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(ImageSensorCell.self, forCellWithReuseIdentifier: "cellId")
        
        setupNavBarButtons()
        
    }
    


    func setupNavBarButtons() {
        
        let searchImage = UIImage(named: "add")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleAddSensor))
        navigationItem.rightBarButtonItems = [searchBarButtonItem]
        
    }
    
    
    func handleAddSensor() {
        
        print(123)
    }

    
    //Here the number of rows that i could integrate data
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! ImageSensorCell
            cell.image = images[indexPath.item]
        return cell

    }
    
    //Data Sensor Row Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width,height: height + 16 + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let vc = SensorDataController(collectionViewLayout: layout)
        print(self.navigationController as Any) // returns nil
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
        
 }


