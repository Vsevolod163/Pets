//
//  AnimalsViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit
import Kingfisher

final class AnimalsViewController: UITableViewController {
    
    private var animals: [CurrentAnimal] = []
    private let storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        fetchData()
        tableView.rowHeight = 150
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailAnimalVC = segue.destination as? DetailAnimalViewController else { return }

        detailAnimalVC.animal = sender as? CurrentAnimal
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let newAnimalVC = segue.source as? NewAnimalViewController else { return }
        guard let animal = newAnimalVC.animal else { return }
        
        var animalType = ""
        var animalKind = ""
        
        if let currentAnimal = animal as? Cat {
            animalType = currentAnimal.type
            animalKind = currentAnimal.animal
        } else if let currentAnimal = animal as? Dog {
            animalType = currentAnimal.type
            animalKind = currentAnimal.animal
        } else if let currentAnimal = animal as? Hamster {
            animalType = currentAnimal.type
            animalKind = currentAnimal.animal
        } else if let currentAnimal = animal as? Horse {
            animalType = currentAnimal.type
            animalKind = currentAnimal.animal
        } else if let currentAnimal = animal as? Goat {
            animalType = currentAnimal.type
            animalKind = currentAnimal.animal
        } else if let currentAnimal = animal as? Camel {
            animalType = currentAnimal.type
            animalKind = currentAnimal.animal
        }
        
        save(
            name: animal.name,
            age: animal.age,
            color: animal.color,
            commands: animal.commands,
            photo: animal.photo,
            type: animalType,
            kind: animalKind
        )
    }
    
    private func fetchData() {
        storageManager.fetchData { [weak self] result in
            switch result {
            case .success(let animals):
                self?.animals = animals
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func save(name: String, age: String, color: String, commands: String, photo: String, type: String, kind: String) {
        storageManager.create(name: name, age: age, color: color, commands: commands, photo: photo, type: type, kind: kind) { animal in
            animals.append(animal)
            tableView.insertRows(
                at: [IndexPath(row: animals.count - 1, section: 0)],
                with: .automatic
            )
        }
    }
}

// MARK: - TableViewDataSource
extension AnimalsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showAnimal", for: indexPath)
        guard let cell = cell as? PetTableViewCell else { return UITableViewCell() }

        if !animals.isEmpty {
            let animal = animals[indexPath.row]
            cell.configure(with: animal)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            animals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - UITableViewDelegate
extension AnimalsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showAnimal", sender: animals[indexPath.row])
    }
}
