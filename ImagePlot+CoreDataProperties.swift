//
//  ImagePlot+CoreDataProperties.swift
//  
//
//  Created by Alexandre Montoya on 15/06/2017.
//
//

import Foundation
import CoreData


extension ImagePlot {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImagePlot> {
        return NSFetchRequest<ImagePlot>(entityName: "ImagePlot")
    }

    @NSManaged public var thumbnailImageName: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var sensor: Sensor?

}
