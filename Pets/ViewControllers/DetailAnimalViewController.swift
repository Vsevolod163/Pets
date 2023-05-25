//
//  DetailAnimalViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit
import Kingfisher

final class DetailAnimalViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var commandsLabel: UILabel!
    @IBOutlet var petImageView: UIImageView!
    
    var animal: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = URL(string: animal.photo)
        
        nameLabel.text = "Name: \(animal.name)"
        ageLabel.text = "Age: \(animal.age)"
        colorLabel.text = "Color: \(animal.color)"
        commandsLabel.text = "Commands: \(animal.commands)"
        petImageView.kf.setImage(with: imageURL)
    }
}
