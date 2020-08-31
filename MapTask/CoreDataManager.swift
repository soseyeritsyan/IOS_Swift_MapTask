//
//  CoreDataManager.swift
//  MapTask
//
//  Created by Sose Yeritsyan on 7/30/20.
//  Copyright © 2020 addevice.kkk. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class CoreDataManager {
  
    static let sharedManager = CoreDataManager()
    private init() {}
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MapTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
            
        })
    return container
  }()
  
  func saveContext () {
    let context = CoreDataManager.sharedManager.persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror)")
      }
    }
  }
    func insertLocation(location: SecondModel) {
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Location",
                                              in: managedContext)!

        let saveLocation = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        saveLocation.setValue(location.timezone, forKeyPath: "timezone")
        saveLocation.setValue(location.country, forKeyPath: "country")
        saveLocation.setValue(location.name, forKeyPath: "name")
        saveLocation.setValue(location.lattitude, forKeyPath: "lattitude")
        saveLocation.setValue(location.longtitude, forKeyPath: "longtitude")
        saveContext()
 
    }
    
    func getLocation(myLocation: SecondModel)->SecondModel? {
        
        var locations = [Location]()
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Location")
        
        let minLatitude = myLocation.lattitude - 5
        let maxLatitude = myLocation.lattitude + 5
        let minLongitude = myLocation.longtitude - 5
        let maxLongitude = myLocation.longtitude + 5
        fetchRequest.predicate = NSPredicate(format: "(%@ <= longtitude) AND (longtitude <= %@) AND (%@ <= lattitude) AND (lattitude <= %@)", NSNumber(value: minLongitude), NSNumber(value: maxLongitude), NSNumber(value: minLatitude), NSNumber(value: maxLatitude))

        do {
            locations = try (managedContext.fetch(fetchRequest) as? [Location])!
            

        } catch let error as NSError {
            print("Could not fetch. \(error)")
        }
        if locations.isEmpty == false {
            
            let randomLocation = locations.randomElement()!
            let returnedValue = SecondModel(timezone: randomLocation.timezone, country: randomLocation.country!, name: randomLocation.name!, lattitude: randomLocation.lattitude, longtitude: randomLocation.longtitude)
            return returnedValue
        } else {
            return nil
        }
    }
    
}
