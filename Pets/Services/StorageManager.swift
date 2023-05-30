//
//  StorageManager.swift
//  Pets
//
//  Created by Vsevolod Lashin on 27.05.2023.
//

import Foundation
import RealmSwift

final class StorageManager {
    static var shared = StorageManager()
    let realm: Realm!

    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    func save(_ animals: [AnimalList]) {
        write {
            realm.add(animals)
        }
    }
    
//    func save(_ animals: [HomeAnimal]) {
//        write {
//            realm.add(animals)
//        }
//    }
//    
//    func save(_ animals: [PackAnimal]) {
//        write {
//            realm.add(animals)
//        }
//    }
    
    func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }
}
