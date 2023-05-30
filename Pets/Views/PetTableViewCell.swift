//
//  PetTableViewCell.swift
//  Pets
//
//  Created by Vsevolod Lashin on 25.05.2023.
//

import UIKit
import Kingfisher

final class PetTableViewCell: UITableViewCell {

    @IBOutlet var petImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with pet: CurrentAnimal) {
        let imageURL = URL(string: pet.photo ?? "")
            
        nameLabel.text = pet.name
        
        petImageView.kf.setImage(with: imageURL)
    }
}
