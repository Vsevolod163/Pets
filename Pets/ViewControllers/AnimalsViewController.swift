//
//  AnimalsViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit
import Kingfisher
//
final class AnimalsViewController: UITableViewController {
    
    //    private var animals: [[Animal]] = Array(repeating: [], count: 2)
    private let dataManager = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTempData()
        
        
//        tableView.rowHeight = 150
//
//        animals[0].append(
//            Cat(
//                animalName: "Lora",
//                animalAge: "2",
//                animalColor: "Gray",
//                animalCommands: "Eat",
//                animalPhoto: "https://cdnn21.img.ria.ru/images/07e4/0c/0a/1588644193_0:321:3071:2048_1280x0_80_0_0_3600040dd7b5ca5093de47c5785e525f.jpg")
//        )
    }
    
    private func createTempData() {
        if !UserDefaults.standard.bool(forKey: "done") {
            dataManager.createTempData { [unowned self] in
                UserDefaults.standard.set(true, forKey: "done")
                tableView.reloadData()
            }
        }
    }
}
//
//    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     guard let detailAnimalVC = segue.destination as? DetailAnimalViewController else { return }
//
//     detailAnimalVC.animal = sender as? Animal
//    }
//
//    @IBAction func unwind(for segue: UIStoryboardSegue) {
//        guard let newAnimalVC = segue.source as? NewAnimalViewController else { return }
//        guard let animal = newAnimalVC.animal else { return }
//
//        var section = 0
//
//        if animal is HomeAnimal {
//            animals[0].append(animal)
//            section = 0
//        } else if animal is PackAnimal {
//            animals[1].append(animal)
//            section = 1
//        }
//
//        tableView.insertRows(at: [IndexPath(row: animals[section].count - 1, section: section)], with: .automatic)
//    }
//}
//// MARK: - TableViewDataSource
//extension AnimalsViewController {
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        animals.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        animals[section].count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "showAnimal", for: indexPath)
//        guard let cell = cell as? PetTableViewCell else { return UITableViewCell() }
//
//        if !animals.isEmpty {
//            let animal = animals[indexPath.section][indexPath.row]
//            cell.configure(with: animal)
//        }
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if animals[section].first is PackAnimal {
//            return "Pack Animals"
//        } else if animals[section].first is HomeAnimal {
//            return "Home Animals"
//        }
//
//        return ""
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            animals[indexPath.section].remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension AnimalsViewController {
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "showAnimal", sender: animals[indexPath.section][indexPath.row])
//    }
//}
