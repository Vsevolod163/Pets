//
//  NewAnimalViewController.swift
//  Pets
//
//  Created by Vsevolod Lashin on 25.05.2023.
//

import UIKit

final class NewAnimalViewController: UIViewController {

    @IBOutlet var dataTFStackView: UIStackView!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    
    private let data = ["Cat", "Dog", "Hamster", "Horse", "Goat", "Camel"]
    var animal: Animal!
    var chosenAnimal: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled = false
        guard let subviews = dataTFStackView.arrangedSubviews as? [UITextField] else { return }
        
        var isAllFieldsFilled: Bool {
            for subview in subviews {
                guard let text = subview.text else {
                    continue
                }
                if text.isEmpty {
                    return false
                }
            }
            return true
        }
        
        for subview in subviews {
            let action = UIAction { [weak self] _ in
                self?.doneButton.isEnabled = isAllFieldsFilled
            }
            subview.addAction(action, for: .editingChanged)
        }
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(2, inComponent: 0, animated: false)
        chosenAnimal = data[2]
    }
    
    @IBAction func doneButtonTapped() {
        guard let subviews = dataTFStackView.arrangedSubviews as? [UITextField] else { return }
        guard let chosenAnimal else { return }
        
        if chosenAnimal == "Cat" {
            animal = Cat(
                name: subviews[0].text ?? "",
                age: subviews[1].text ?? "",
                color: subviews[2].text ?? "",
                commands: subviews[3].text ?? "",
                photo: subviews[4].text ?? ""
            )
        } else if chosenAnimal == "Dog" {
            animal = Dog(
                name: subviews[0].text ?? "",
                age: subviews[1].text ?? "",
                color: subviews[2].text ?? "",
                commands: subviews[3].text ?? "",
                photo: subviews[4].text ?? ""
            )
            print(1)
        } else if chosenAnimal == "Hamster" {
            animal = Hamster(
                name: subviews[0].text ?? "",
                age: subviews[1].text ?? "",
                color: subviews[2].text ?? "",
                commands: subviews[3].text ?? "",
                photo: subviews[4].text ?? ""
            )
        } else if chosenAnimal == "Horse" {
            animal = Horse(
                name: subviews[0].text ?? "",
                age: subviews[1].text ?? "",
                color: subviews[2].text ?? "",
                commands: subviews[3].text ?? "",
                photo: subviews[4].text ?? ""
            )
        } else if chosenAnimal == "Goat" {
            animal = Goat(
                name: subviews[0].text ?? "",
                age: subviews[1].text ?? "",
                color: subviews[2].text ?? "",
                commands: subviews[3].text ?? "",
                photo: subviews[4].text ?? ""
            )
        } else if chosenAnimal == "Camel" {
            animal = Camel(
                name: subviews[0].text ?? "",
                age: subviews[1].text ?? "",
                color: subviews[2].text ?? "",
                commands: subviews[3].text ?? "",
                photo: subviews[4].text ?? ""
            )
        }
        
        dismiss(animated: true)
    }
}

extension NewAnimalViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenAnimal = data[row]
    }
}

