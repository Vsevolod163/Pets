//
//  Animal.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

class Animal {
    var name: String
    var age: Int
    var color: String
    var commands: [String]
    
    init(name: String, age: Int, color: String, commands: [String]) {
        self.name = name
        self.age = age
        self.color = color
        self.commands = commands
    }
}

class PackAnimal: Animal {
    private let type = "Pack"
}

class HomeAnimal: Animal {
    private let type = "Home Animal"
}

final class Horse: PackAnimal {
   private let type = "Horse"
}

final class Camel: PackAnimal {
    var hump: Int
    private let type = "Camel"
    
    init(name: String, age: Int, color: String, commands: [String], hump: Int) {
        self.hump = hump
        super.init(name: name, age: age, color: color, commands: commands)
    }
}

final class Goat: PackAnimal {
    private let type = "Goat"
}

final class Cat: HomeAnimal {
    private let type = "Cat"
}

final class Dog: HomeAnimal {
    private let type = "Dog"
}

final class Hamster: HomeAnimal {
    private let type = "Hamster"
}

