//
//  Image.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 05/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

class Sensores: NSObject {
    
    var sensorId: String?
    
}


class Feed: NSObject {
    
    var moduleID:String?
    var thumbnailImageName: String?
    var image: UIImage?
    
    var humidityUnit: String?
    var humidityData: NSNumber?
    
    var windUnit: String?
    var windData: NSNumber?
    
    var tempUnit: String?
    var tempData: NSNumber?
    
    var date: NSDate?
    
    var sensores: Sensores?
    
}
    
