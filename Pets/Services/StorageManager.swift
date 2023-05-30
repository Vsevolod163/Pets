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
        let container = NSPersistentContainer(name: "AnimalList")
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
    func create(name: String, age: String, color: String, commands: String, photo: String, type: String, kind: String) {
        let animal = CurrentAnimal(context: viewContext)
        
        animal.name = name
        animal.age = age
        animal.color = color
        animal.commands = commands
        animal.photo = photo
        animal.type = type
        animal.kind = kind
        
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
    
    func update(_ animal: CurrentAnimal, name: String, age: String, color: String, commands: String, photo: String, type: String, kind: String) {
        animal.name = name
        animal.age = age
        animal.color = color
        animal.commands = commands
        animal.photo = photo
        animal.type = type
        animal.kind = kind
       
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
