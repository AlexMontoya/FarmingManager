//
//  ViewController.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 29/05/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//
import Mapbox
import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var mathiasFields: MGLCoordinateBounds!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nibl
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
            titleLabel.text = "My Fields"
            titleLabel.textColor = UIColor.rgb(red: 235, green: 240, blue: 245)
            titleLabel.font = UIFont.systemFont(ofSize: 18)
            titleLabel.textAlignment = .center
            navigationItem.titleView = titleLabel
        
        let mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.satelliteStyleURL(withVersion: 9))
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Set the map’s center coordinate and zoom level.
        mapView.setCenter(CLLocationCoordinate2D(latitude: 48.552216, longitude: 3.846474), zoomLevel: 16, animated: false)
        
        let ne = CLLocationCoordinate2D(latitude: 48.7, longitude: 3.9)
        let sw = CLLocationCoordinate2D(latitude: 47.5, longitude: 3.7)
        
        mathiasFields = MGLCoordinateBounds(sw: sw, ne:ne)
        
        view.addSubview(mapView)
        
        //setupNavBarButtons()
        
    }
    
 
    /*func setupNavBarButtons() {
        
        let searchImage = UIImage(named: "searchimage")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        navigationItem.rightBarButtonItems = [searchBarButtonItem]
        
        let listImage = UIImage(named: "menuimage")?.withRenderingMode(.alwaysOriginal)
        let listBarButtonItem = UIBarButtonItem(image: listImage, style: .plain, target: self, action: #selector(handleList))
        
        navigationItem.rightBarButtonItems = [listBarButtonItem, searchBarButtonItem]

        
    }
    
    
    func handleSearch() {
    
        print(123)
    }
    
    func handleList() {
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/


 }
