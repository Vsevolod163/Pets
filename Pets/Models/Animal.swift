//
//  Animal.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import RealmSwift

final class AnimalList: Object {
    @Persisted private var title: String
    @Persisted private var animals = List<Animal>()
    
    var animalsTitle: String {
        get {
            title
        } set {
            title = newValue
        }
    }
    
    var animalsList: List<Animal> {
        get {
            animals
        } set {
            animals = newValue
        }
    }
}

class Animal: Object {
    @Persisted private var animalName: String
    @Persisted private var animalAge: String
    @Persisted private var animalColor: String
    @Persisted private var animalCommands: String
    @Persisted private var animalPhoto: String
    
    var name: String {
        get {
            animalName
        } set {
            animalName = newValue
        }
    }
    
    var age: String {
        get {
            animalAge
        } set {
            animalAge = newValue
        }
    }
    
    var color: String {
        get {
            animalColor
        } set {
            animalColor = newValue
        }
    }
    
    var commands: String {
        get {
            animalCommands
        }
        set {
            animalCommands = newValue
        }
    }
    
    var photo: String {
        get {
            animalPhoto
        } set {
            animalPhoto = newValue
        }
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
