//
//  Person+CoreDataProperties.swift
//  SavingCoreData
//
//  Created by Victor Lee on 8/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}
