//
//  DetailAnimalViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit
import Kingfisher

final class DetailAnimalViewController: UIViewController {

    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var commandsLabel: UILabel!
    @IBOutlet var petImageView: UIImageView!
    
    var animal: CurrentAnimal!
    
    private let storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = URL(string: animal.photo ?? "")
        
        animalLabel.text = "Animal: \(animal.kind ?? "")"
        animalTypeLabel.text = "Type: \(animal.type ?? "")"
        nameLabel.text = "Name: \(animal.name ?? "")"
        ageLabel.text = "Age: \(animal.age ?? "")"
        colorLabel.text = "Color: \(animal.color ?? "")"
        commandsLabel.text = "Commands: \(animal.commands ?? "")"
        petImageView.kf.setImage(with: imageURL)
    }
    
    @IBAction func addCommands() {
        showAlert(with: "Add commands", and: "What commands do you want to add?")
    }

    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addTextField()
        alert.textFields?.first?.text = animal.commands
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let commands = alert.textFields?.first?.text else { return }
            guard !commands.isEmpty else { return }
            
            self?.animal.commands = commands
            self?.commandsLabel.text = "Commands: \(self?.animal.commands ?? "")"
            self?.storageManager.update(self?.animal ?? CurrentAnimal(), newCommands: commands)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true)
        }

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
}
