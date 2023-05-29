//
//  DataManager.swift
//  Pets
//
//  Created by Vsevolod Lashin on 27.05.2023.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    private let storageManager = StorageManager.shared
    
    private init() {}

    func createTempData(completion: @escaping () -> Void) {
        var homeAnimalsList: [Animal] = []
        var packAnimalsList: [Animal] = []
        
        let cat = HomeAnimal()
        cat.name = "Sara"
        cat.age = "2"
        cat.color = "gray"
        cat.commands = "play"
        cat.photo = ""
        
        let horse = PackAnimal()
        cat.name = "L"
        cat.age = "1"
        cat.color = "white"
        cat.commands = "forward"
        cat.photo = ""
        
        homeAnimalsList.append(cat)
        packAnimalsList.append(horse)
        
        DispatchQueue.main.async { [unowned self] in
            storageManager.save(homeAnimalsList, packAnimalsList)
            completion()
        }
    }
}
