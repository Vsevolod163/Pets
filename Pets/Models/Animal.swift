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
    private let type = "Home"
}

final class Horse: PackAnimal {
    let animal = "Horse"
}

final class Camel: PackAnimal {
    let hump: Int
    let animal = "Camel"

    init(name: String, age: Int, color: String, commands: [String], hump: Int) {
        self.hump = hump
        super.init(name: name, age: age, color: color, commands: commands)
    }
}

final class Goat: PackAnimal {
    let animal = "Goat"
}

final class Cat: HomeAnimal {
    let animal = "Cat"
}

final class Dog: HomeAnimal {
    let animal = "Dog"
}

final class Hamster: HomeAnimal {
    let animal = "Hamster"
}

