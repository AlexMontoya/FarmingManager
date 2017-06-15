//
//  Sensor+CoreDataProperties.swift
//  
//
//  Created by Alexandre Montoya on 15/06/2017.
//
//

import Foundation
import CoreData


extension Sensor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sensor> {
        return NSFetchRequest<Sensor>(entityName: "Sensor")
    }

    @NSManaged public var sensorId: String?
    @NSManaged public var images: ImagePlot?
    @NSManaged public var weather: Type?

}
