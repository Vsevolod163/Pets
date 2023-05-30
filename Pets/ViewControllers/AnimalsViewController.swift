//
//  AnimalsViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit
import Kingfisher

final class AnimalsViewController: UITableViewController {
    
    // MARK: - Private Properties
    private var animals: [CurrentAnimal] = []
    private let storageManager = StorageManager.shared
    
    // MARK: - View life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        fetchData()
        tableView.rowHeight = 150
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailAnimalVC = segue.destination as? DetailAnimalViewController else { return }

        detailAnimalVC.animal = sender as? CurrentAnimal
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        fetchData()
        tableView.reloadData()
    }
    
    // MARK: - CoreData
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
            storageManager.delete(animals[indexPath.row])
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
