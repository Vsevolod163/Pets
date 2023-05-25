//
//  EditViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 25.05.2023.
//

import UIKit

final class EditViewController: UIViewController {

    @IBOutlet var nameTF: UITextField!
    @IBOutlet var ageTF: UITextField!
    @IBOutlet var colorTF: UITextField!
    @IBOutlet var commandsTF: UITextField!
    @IBOutlet var photoTF: UITextField!
    
    @IBOutlet var animalPikerView: UIPickerView!
    
    var animal: Animal!
    
    private let data = ["Cat", "Dog", "Hamster", "Horse", "Goat", "Camel"]
    private var chosenAnswer: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = animal.name
        ageTF.text = animal.age
        colorTF.text = animal.color
        commandsTF.text = animal.commands
        photoTF.text = animal.photo
        
        let rowForPickerView = data.firstIndex(of: animal.name) ?? 0
        animalPikerView.selectRow(rowForPickerView, inComponent: 0, animated: true)
    }
}

// MARK: - UIPickerView
extension EditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenAnswer = data[row]
    }
}
