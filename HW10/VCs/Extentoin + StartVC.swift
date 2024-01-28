//
//  Extentoin + StartVC.swift
//  HW10
//
//  Created by Nur on 12/26/23.
//

import UIKit

extension StartViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isDataLoaded() {
        if Valute.valutes.isEmpty {
            fetchdata()
        } else {
            self.dateLable.text = Corrency.date
            fetchdata()
        }
    }
    
    func showUpdateAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: "Обновлено", preferredStyle: .actionSheet)
            self.present(alert, animated: false, completion: nil)
            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { _ in alert.dismiss(animated: false, completion: nil)} )
        }
    }
    
    func showErrorAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: "Не удалось обновить данные", preferredStyle: .actionSheet)
            self.present(alert, animated: false, completion: nil)
            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { _ in alert.dismiss(animated: false, completion: nil)} )
        }
    }
    
    func findValue(_ charCode: String) -> Valute? {
        var correctValute: Valute?
        for valute in Valute.valutes {
            if valute.charCode == charCode {
                correctValute = valute
            }
        }
        return correctValute
    }
    
    func valuteManager(_ valute: Valute) {
        Valute.chosenValute = valute
        setupTextFields()
    }
    
    func isInputContainNumber() -> Bool {
            if Double(inputTextField.text ?? "") != nil {
                return true
            } else {
                return false
            }
        }
        
    func setupCalculatedLable(_ data: Double) {
        let newValueForLable = "  \(String(format: "%.2f", data))"
            outputTextLable.text = newValueForLable
        guard let charCode = Valute.chosenValute?.charCode else { return }
        outputTextLable.text = "\(newValueForLable) \(charCode)"
        }
        
        
    func setupTextFields() {
            let containNumber = isInputContainNumber()
            reverseButtone.isHidden = !containNumber
            let input = inputTextField.text
            if input == "" || !containNumber {
                setTextFieldsDefaoultParametrs()
            } else {
                guard Valute.chosenValute != nil else { return }
                let input = inputTextField.text
                calculateInputValue(input!)
            }
        }
    
    func setTextFieldsDefaoultParametrs() {
        inputTextField.text = ""
        outputTextLable.text = Valute.chosenValute?.charCode
        reverseButtone.isHidden = true
    }
    
    func calculateInputValue(_ input: String) {
        let input = Double(input)
        guard let valute = Valute.chosenValute else { return }
        var output = 0.0
        if valute.nominal! == 1 {
            output = input! / valute.value!
        } else if valute.nominal! > 1 {
            output = input! / valute.value! * Double(valute.nominal!)
        }
        setupCalculatedLable(output)
    }
    
    func setupReversedValuesByButtone() {
        let input = Double(inputTextField.text!)
        guard let valute = Valute.chosenValute else { return }
        outputTextLable.text = "  \(inputTextField.text!) \(valute.charCode ?? "")"
        var output = 0.0
        if valute.nominal! == 1 {
            output = input! * valute.value!
        } else if valute.nominal! > 1 {
            output = input! * valute.value! / Double(valute.nominal!)
        }
        let roundedOutput = String(format: "%.2f", output)
        inputTextField.text = roundedOutput
    }
}

