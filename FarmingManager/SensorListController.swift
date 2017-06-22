//
//  SensorListController.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 30/05/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class SensorListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var feeds: [Feed] = {
     
        var dSchool1 = Feed()
        dSchool1.thumbnailImageName = "2:06-perpendiculaire"
        dSchool1.humidityUnit = "%"
        dSchool1.humidityData = 10
        dSchool1.windUnit = "km/h"
        dSchool1.windData = 10
        dSchool1.tempUnit = "°C"
        dSchool1.tempData = 10
        
        
        
        var dSchool2 = Feed()
        dSchool2.thumbnailImageName = "2:06-sud"
        dSchool2.humidityUnit = "%"
        dSchool2.humidityData = 20
        dSchool2.windUnit = "km/h"
        dSchool2.windData = 20
        dSchool2.tempUnit = "°C"
        dSchool2.tempData = 20
        
        return [dSchool1, dSchool2]
        
    }()
    
    //var feeds: [Feed]?
    
    func fetchImages() {
        
    
        let user = "ceres"
        let password = "Tester007!"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        
       let task = Alamofire.request("http://pa.apps.bosch-iot-cloud.com/api/v1/modules/10359316077825617/images", headers: headers)
            .responseJSON { response in
                
                if let json = response.result.value {
                    
                    for dictionary in json as! [[String: AnyObject]]
                    {
                        print(dictionary["id"]!)
                        
                        if let id = dictionary["id"]{
                        
                        Alamofire.request("http://pa.apps.bosch-iot-cloud.com/api/v1/modules/10359316077825617/images/\(id)", headers: headers).responseImage { response in

                            if let image = response.result.value {
                                print("ton image : \(image)")
                            }
                        }
                        
                        }
                    }
                }
            }
            task.resume()
    }
    
    func fetchWeather() {
        
        let user = "ceres"
        let password = "Tester007!"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        
        let task2 = Alamofire.request("http://pa.apps.bosch-iot-cloud.com/api/v1/modules/10359316077825617/history?start=2017-06-1T10:45:27.00Z&end=2020-01-1T10:45:26.00Z", headers: headers)
            .responseJSON { response in
                
                if let json = response.result.value {
                    
                    for weather in json as! [[String: AnyObject]]
                    {
                        if let values = weather["values"] as? NSDictionary{
                        
                            print(values)
                            if let wps = values["WPS_AM1_2"]{
                                print(wps)

                            }
                            //print(valu)

                        }
                        
                    }
                }
            }
            task2.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImages()
        fetchWeather()
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "My Sensors"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        
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
        return feeds.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! ImageSensorCell
            cell.feed = feeds[indexPath.item]
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


