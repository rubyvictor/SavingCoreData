//
//  PersistenceService.swift
//  SavingCoreData
//
//  Created by Victor Lee on 8/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation
import CoreData

class PersistenceService {
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SavingCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
