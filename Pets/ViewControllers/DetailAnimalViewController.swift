//
//  DetailAnimalViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 24.05.2023.
//

import UIKit

final class DetailAnimalViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var commandsLabel: UILabel!
    
    var animal: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(animal.name)"
        ageLabel.text = "Age: \(animal.age.formatted())"
        colorLabel.text = "Color: \(animal.color)"
        commandsLabel.text = "Commands: \(animal.commands.joined(separator: ", "))"
    }
}
