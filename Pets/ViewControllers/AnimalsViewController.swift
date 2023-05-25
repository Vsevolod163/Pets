//
//  AnimalsViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit

final class AnimalsViewController: UITableViewController {
    
    private let animals = [
        Horse(name: "Vasiliy", age: 2, color: "Gray", commands: ["Forward", "Play"]),
        Cat(name: "Lora", age: 2, color: "White", commands: ["Eat"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let detailAnimalVC = segue.destination as? DetailAnimalViewController else { return }
         
         detailAnimalVC.animal = sender as? Animal
     }
}
// MARK: - TableViewDataSource
extension AnimalsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showAnimal", for: indexPath)

        var content = cell.defaultContentConfiguration()
        
        
        if let animal = animals[indexPath.row] as? Cat {
            content.text = animal.name
            content.secondaryText = animal.animal
        } else if let animal = animals[indexPath.row] as? Dog {
            content.text = animal.name
            content.secondaryText = animal.animal
        } else if let animal = animals[indexPath.row] as? Hamster {
            content.text = animal.name
            content.secondaryText = animal.animal
        } else if let animal = animals[indexPath.row] as? Horse {
            content.text = animal.name
            content.secondaryText = animal.animal
        } else if let animal = animals[indexPath.row] as? Goat {
            content.text = animal.name
            content.secondaryText = animal.animal
        } else if let animal = animals[indexPath.row] as? Camel {
            content.text = animal.name
            content.secondaryText = animal.animal
        }
        
        content.image = UIImage(named: "cat")
        
        cell.contentConfiguration = content

        return cell
    }
    


    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

}

// MARK: - UITableViewDelegate
extension AnimalsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showAnimal", sender: animals[indexPath.row])
    }
}
