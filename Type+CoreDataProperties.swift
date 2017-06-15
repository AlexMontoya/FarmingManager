//
//  Type+CoreDataProperties.swift
//  
//
//  Created by Alexandre Montoya on 15/06/2017.
//
//

import Foundation
import CoreData


extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "WeatherType")
    }

    @NSManaged public var name: String?
    @NSManaged public var pictoImageName: String?
    @NSManaged public var sensor: Sensor?
    @NSManaged public var data: NSSet?

}

// MARK: Generated accessors for data
extension Type {

    @objc(addDataObject:)
    @NSManaged public func addToData(_ value: Data)

    @objc(removeDataObject:)
    @NSManaged public func removeFromData(_ value: Data)

    @objc(addData:)
    @NSManaged public func addToData(_ values: NSSet)

    @objc(removeData:)
    @NSManaged public func removeFromData(_ values: NSSet)

}
