//
//  Animal.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

class Animal {
    var name: String
    var age: String
    var color: String
    var commands: String
    var photo: String
    
    init(name: String, age: String, color: String, commands: String, photo: String) {
        self.name = name
        self.age = age
        self.color = color
        self.commands = commands
        self.photo = photo
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
    let animal = "Camel"
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

