//
//  Animal.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

class Animal {
    private let animalName: String
    private let animalAge: String
    private let animalColor: String
    private var animalCommands: String
    private let animalPhoto: String
    
    var name: String {
        animalName
    }
    
    var age: String {
        animalAge
    }
    
    var color: String {
        animalColor
    }
    
    var commands: String {
        get {
            return animalCommands
        }
        set {
            animalCommands = newValue
        }
    }
    
    var photo: String {
        animalPhoto
    }
    
    init(animalName: String, animalAge: String, animalColor: String, animalCommands: String, animalPhoto: String) {
        self.animalName = animalName
        self.animalAge = animalAge
        self.animalColor = animalColor
        self.animalCommands = animalCommands
        self.animalPhoto = animalPhoto
    }
    
}

class PackAnimal: Animal {
    private let animalType = "Pack"
    
    var type: String {
        animalType
    }
}

class HomeAnimal: Animal {
    private let animalType = "Home"
    
    var type: String {
        animalType
    }
}

final class Horse: PackAnimal {
    private let currentAnimal = "Horse"
    
    var animal: String {
        currentAnimal
    }
}

final class Camel: PackAnimal {
    private let currentAnimal = "Camel"
    
    var animal: String {
        currentAnimal
    }
}

final class Goat: PackAnimal {
    private let currentAnimal = "Goat"
    
    var animal: String {
        currentAnimal
    }
}

final class Cat: HomeAnimal {
    private let currentAnimal = "Cat"
    
    var animal: String {
        currentAnimal
    }
}

final class Dog: HomeAnimal {
    private let currentAnimal = "Dog"
    
    var animal: String {
        currentAnimal
    }
}

final class Hamster: HomeAnimal {
    private let currentAnimal = "Hamster"
    
    var animal: String {
        currentAnimal
    }
}

