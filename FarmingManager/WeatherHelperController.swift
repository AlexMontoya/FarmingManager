//
//  WeatherListController.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 13/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import CoreData

import UIKit

extension WeatherCell {
    
    func clearData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            do {
                
                let entityNames = ["WeatherType", "Data"]
                
                for entityName in entityNames {
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                
                let objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                
                for object in objects! {
                    context.delete(object)
                }
                try(context.save())
            }
                
            }
            
            catch let err {
                print(err)
            }
        }
    }
    
    func setupData() {
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            
            
            let humidity = NSEntityDescription.insertNewObject(forEntityName: "WeatherType", into: context) as! Type
            humidity.name = "Humidity :"
            humidity.pictoImageName = "sun"
            
            let data = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context) as! Data
            data.weathertype = humidity
            data.text = "30 %"
            
            let wind = NSEntityDescription.insertNewObject(forEntityName: "WeatherType", into: context) as! Type
            wind.name = "Wind :"
            wind.pictoImageName = "sun"
            
            let winddata = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context) as! Data
            winddata.weathertype = wind
            winddata.text = "30 km/h"
            
            let rain = NSEntityDescription.insertNewObject(forEntityName: "WeatherType", into: context) as! Type
            rain.name = "Rain :"
            rain.pictoImageName = "sun"
            
            let raindata = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context) as! Data
            raindata.weathertype = rain
            raindata.text = "30 mm"
            
            let soiltemp = NSEntityDescription.insertNewObject(forEntityName: "WeatherType", into: context) as! Type
            soiltemp.name = "Soil Temperature :"
            soiltemp.pictoImageName = "sun"
            
            let soiltempdata = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context) as! Data
            soiltempdata.weathertype = soiltemp
            soiltempdata.text = "30 °C"
            
            let temp = NSEntityDescription.insertNewObject(forEntityName: "WeatherType", into: context) as! Type
            temp.name = "Temperature :"
            temp.pictoImageName = "sun"
            
            let tempdata = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context) as! Data
            tempdata.weathertype = temp
            tempdata.text = "30 °C"
            
            let soilmoisture = NSEntityDescription.insertNewObject(forEntityName: "WeatherType", into: context) as! Type
            soilmoisture.name = "Soil Moisture :"
            soilmoisture.pictoImageName = "sun"
            
            let soilmoisturedata = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context) as! Data
            soilmoisturedata.weathertype = soiltemp
            soilmoisturedata.text = "30 %"
            
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
            
        }
    
        loadData()
    }

        func loadData() {
            
            let delegate = UIApplication.shared.delegate as? AppDelegate
            if let context = delegate?.persistentContainer.viewContext {
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
                
                do {
                    datas = try(context.fetch(fetchRequest)) as? [Data]
                } catch let err {
                    print(err)
                }
                
            }
            
        }
        
        
}

    

