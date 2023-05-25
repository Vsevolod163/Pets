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

    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled = false
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(2, inComponent: 0, animated: false)
    }
    
    
    @IBAction func doneButtonTapped() {
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
        let selectedData = data[row]
        // Выполните необходимые действия при выборе элемента
    }
}

