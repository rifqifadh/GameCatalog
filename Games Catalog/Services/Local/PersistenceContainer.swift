//
//  PersistenceContainer.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 26/07/20.
//

import Foundation
import CoreData

class PersistentContainer {
    public static var context: NSManagedObjectContext {
            return persistentContainer.viewContext
    }
    
    init() {}
    
    public static var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "GameCatalog")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }()
}
