//
//  StorageManager.swift
//  Pets
//
//  Created by Vsevolod Lashin on 27.05.2023.
//

import Foundation
import CoreData

final class StorageManager {
    static var shared = StorageManager()
    
    // MARK: - Core Data stack
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TaskList")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = persistentContainer.viewContext
    }
    
    // MARK: - CRUD
    func create(_ animalName: String, completion: (CurrentAnimal) -> Void) {
        let animal = CurrentAnimal(context: viewContext)
        animal.name = animalName
        completion(animal)
        saveContext()
    }
    
    func fetchData(completion: (Result<[CurrentAnimal], Error>) -> Void) {
        let fetchRequest = CurrentAnimal.fetchRequest()
        
        do {
            let animals = try viewContext.fetch(fetchRequest)
            completion(.success(animals))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func update(_ animal: CurrentAnimal, newName: String) {
        animal.name = newName
        saveContext()
    }
    
    func delete(_ animal: CurrentAnimal) {
        viewContext.delete(animal)
        saveContext()
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
