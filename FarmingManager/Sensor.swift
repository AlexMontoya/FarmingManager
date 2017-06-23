//
//  Image.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 05/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit


/*
class Sensor: NSObject {
    
    var sensorId: String?
    
}


class ImagePlot: NSObject {
    
    var thumbnailImageName: String?
    var date: NSDate?
    
    var sensor: Sensor?
    
}



//Weather Type
class Type: NSObject {
    
    var name: String?
    var pictoImageName: String?
    
    var sensor: Sensor?
    
}

//Weather Data
class Data: NSObject {
    
    var text: String?
    var date: NSDate?
    
    var type: Type?
}
*/

class Sensores: NSObject {
    
    var sensorId: String?
    
}


class Feed: NSObject {
    
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
    
