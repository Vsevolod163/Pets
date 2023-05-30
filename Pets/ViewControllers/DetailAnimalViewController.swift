//
//  DetailAnimalViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit
import Kingfisher

protocol EditAnimalViewControllerDelegate: AnyObject {
    func updateUI()
}

final class DetailAnimalViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var commandsLabel: UILabel!
    @IBOutlet var petImageView: UIImageView!
    
    // MARK: - Properties
    var animal: CurrentAnimal!
    
    // MARK: - Private Properties
    private let storageManager = StorageManager.shared
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDetailUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let editVC = segue.destination as? EditAnimalViewController else { return }
        
        editVC.animal = animal
        editVC.delegate = self
    }
    
    private func updateDetailUI() {
        let imageURL = URL(string: animal.photo ?? "")
        
        animalLabel.text = "Animal: \(animal.kind ?? "")"
        animalTypeLabel.text = "Type: \(animal.type ?? "")"
        nameLabel.text = "Name: \(animal.name ?? "")"
        ageLabel.text = "Age: \(animal.age ?? "")"
        colorLabel.text = "Color: \(animal.color ?? "")"
        commandsLabel.text = "Commands: \(animal.commands ?? "")"
        petImageView.kf.setImage(with: imageURL)
    }
}

extension DetailAnimalViewController: EditAnimalViewControllerDelegate {
    func updateUI() {
        updateDetailUI()
    }
}
