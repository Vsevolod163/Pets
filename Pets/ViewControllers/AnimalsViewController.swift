//
//  AnimalsViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit
import Kingfisher

final class AnimalsViewController: UITableViewController {
    
    private var animals = [
        Horse(name: "Vasiliy", age: "2", color: "Gray", commands: "Forward, Play", photo: "https://miratorg.ru/upload/resize_cache/iblock/da5/770_513_1/horse.jpg"),
        Cat(name: "Lora", age: "1", color: "White", commands: "Eat", photo: "https://www.purina.ru/sites/default/files/2021-10/britanskaya-3.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     guard let detailAnimalVC = segue.destination as? DetailAnimalViewController else { return }
     
     detailAnimalVC.animal = sender as? Animal
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let newAnimalVC = segue.source as? NewAnimalViewController else { return }
        
        animals.append(newAnimalVC.animal)
        tableView.insertRows(at: [IndexPath(row: animals.count - 1, section: 0)], with: .automatic)
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
        
        let animal = animals[indexPath.row]
        cell.configure(with: animal)

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
