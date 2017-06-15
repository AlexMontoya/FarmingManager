//
//  Data+CoreDataProperties.swift
//  
//
//  Created by Alexandre Montoya on 15/06/2017.
//
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var weathertype: Type?

}
