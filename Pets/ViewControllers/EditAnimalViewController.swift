//
//  EditAnimalViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 30.05.2023.
//

import UIKit

final class EditAnimalViewController: UIViewController {

    @IBOutlet var nameTF: UITextField!
    @IBOutlet var ageTF: UITextField!
    @IBOutlet var colorTF: UITextField!
    @IBOutlet var commandsTF: UITextField!
    @IBOutlet var photoTF: UITextField!
    
    @IBOutlet var animalPickerView: UIPickerView!
    
    var animal: CurrentAnimal!
    unowned var delegate: EditAnimalViewControllerDelegate!
    
    private let storageManager = StorageManager.shared
    private let data = ["Cat", "Dog", "Hamster", "Horse", "Goat", "Camel"]
    private var chosenAnimal: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        animalPickerView.delegate = self
        animalPickerView.dataSource = self
        animalPickerView.selectRow(data.firstIndex(of: animal.kind ?? "") ?? 0, inComponent: 0, animated: false)
        chosenAnimal = animal.kind
    }
    
    @IBAction func closeButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonPressed() {
        var type = ""
        
        if ["Cat", "Dog", "Hamster"].contains(chosenAnimal) {
            type = "Home"
        } else {
            type = "Pack"
        }
        
        storageManager.update(
            animal,
            name: nameTF.text ?? "",
            age: ageTF.text ?? "",
            color: colorTF.text ?? "",
            commands: commandsTF.text ?? "",
            photo: photoTF.text ?? "",
            type: type,
            kind: chosenAnimal
        )
        
        dismiss(animated: true)
        delegate.updateUI()
    }
    
    private func updateUI() {
        nameTF.text = animal.name
        ageTF.text = animal.age
        colorTF.text = animal.color
        commandsTF.text = animal.commands
        photoTF.text = animal.photo
    }
}

extension EditAnimalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenAnimal = data[row]
    }
    
}
