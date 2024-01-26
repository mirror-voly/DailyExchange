//
//  Extentoin + StartVC.swift
//  HW10
//
//  Created by Nur on 12/26/23.
//

import UIKit

extension StartViewController {
    
    func fetchdata() {
        guard let url = URL(string: dataSourseURL) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let corency = try JSONDecoder().decode(Corrency.self, from: data)
                Valute.valutes.removeAll()
                Valute.valutes.append(contentsOf: corency.valute!.values)
                Corrency.date = "Данные от - \(corency.timestamp?.replacingOccurrences(of: "T", with: " ").replacingOccurrences(of: "+03:00", with: " по МСК") ?? "Error, can't find timestamp")"
                DispatchQueue.main.async {
                    self.dateLable.text = Corrency.date
                }
                StorageManager.saveToCash()
                self.showUpdateAlert()
            } catch let error {
                print(error)
                self.showErrorAlert()
            }
        }
        dataTask.resume()
    }
    
    func isDataLoaded() {
        if Valute.valutes .isEmpty {
            fetchdata()
        } else {
            self.dateLable.text = Corrency.date
            fetchdata()
        }
    }
    func showUpdateAlert() {
        let alert = UIAlertController(title: nil, message: "Обновлено", preferredStyle: .actionSheet)
        self.present(alert, animated: false, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in alert.dismiss(animated: false, completion: nil)} )
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: nil, message: "Ошибка сети", preferredStyle: .actionSheet)
        self.present(alert, animated: false, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in alert.dismiss(animated: false, completion: nil)} )
    }
    
    func setPopUpButtone() {
        let optionClosure = { (action : UIAction) in
            if action.title == "-" {
                Valute.lustChangedValute = nil
                self.outputTextLable.text = " -"
                self.popUpButtone.setTitleColor(.gray, for: .normal)
            }
            else {
                self.popUpButtone.setTitleColor(.orange, for: .normal)
            }
            self.findValue(action.title)
        }
        let image = UIImage(systemName: "poweroff")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        
        
        popUpButtone.menu = UIMenu (children : [
            UIAction(title: "-", image: image?.withTintColor(.gray), state: .on, handler: optionClosure),
            UIAction(title: "AED", image: image, handler: optionClosure),
            UIAction(title: "AMD", image: image, handler: optionClosure),
            UIAction(title: "AUD", image: image, handler: optionClosure),
            UIAction(title: "AZN", image: image, handler: optionClosure),
            UIAction(title: "BGN", image: image, handler: optionClosure),
            UIAction(title: "BRL", image: image, handler: optionClosure),
            UIAction(title: "BYN", image: image, handler: optionClosure),
            UIAction(title: "CAD", image: image, handler: optionClosure),
            UIAction(title: "CHF", image: image, handler: optionClosure),
            UIAction(title: "CNY", image: image, handler: optionClosure),
            UIAction(title: "CZK", image: image, handler: optionClosure),
            UIAction(title: "DKK", image: image, handler: optionClosure),
            UIAction(title: "EGP", image: image, handler: optionClosure),
            UIAction(title: "EUR", image: image, handler: optionClosure),
            UIAction(title: "GBP", image: image, handler: optionClosure),
            UIAction(title: "GEL", image: image, handler: optionClosure),
            UIAction(title: "HKD", image: image, handler: optionClosure),
            UIAction(title: "HUF", image: image, handler: optionClosure),
            UIAction(title: "IDR", image: image, handler: optionClosure),
            UIAction(title: "INR", image: image, handler: optionClosure),
            UIAction(title: "JPY", image: image, handler: optionClosure),
            UIAction(title: "KGS", image: image, handler: optionClosure),
            UIAction(title: "KRW", image: image, handler: optionClosure),
            UIAction(title: "KZT", image: image, handler: optionClosure),
            UIAction(title: "MDL", image: image, handler: optionClosure),
            UIAction(title: "NOK", image: image, handler: optionClosure),
            UIAction(title: "NZD", image: image, handler: optionClosure),
            UIAction(title: "PLN", image: image, handler: optionClosure),
            UIAction(title: "QAR", image: image, handler: optionClosure),
            UIAction(title: "RON", image: image, handler: optionClosure),
            UIAction(title: "RSD", image: image, handler: optionClosure),
            UIAction(title: "SEK", image: image, handler: optionClosure),
            UIAction(title: "SGD", image: image, handler: optionClosure),
            UIAction(title: "THB", image: image, handler: optionClosure),
            UIAction(title: "TJS", image: image, handler: optionClosure),
            UIAction(title: "TMT", image: image, handler: optionClosure),
            UIAction(title: "TRY", image: image, handler: optionClosure),
            UIAction(title: "UAH", image: image, handler: optionClosure),
            UIAction(title: "USD", image: image, handler: optionClosure),
            UIAction(title: "UZS", image: image, handler: optionClosure),
            UIAction(title: "VND", image: image, handler: optionClosure),
            UIAction(title: "XDR", image: image, handler: optionClosure),
            UIAction(title: "ZAR", image: image, handler: optionClosure)
        ])
    }
    func findValue(_ charCode: String) {
        for valute in Valute.valutes {
            if valute.charCode == charCode {
                converValue(valute)
                Valute.lustChangedValute = valute
            }
        }
    }
    
    func converValue(_ valute: Valute) {
        guard let input = Double(inputTextField.text ?? "") else { return }
        var output = 0.0
        if valute.nominal! == 1 {
            output = input / valute.value!
        } else if valute.nominal! > 1 {
            output = input / valute.value! * Double(valute.nominal!)
        }
        setupConvertedLable(output)
    }
    
    func setupConvertedLable(_ data: Double) {
        let newValueForLable = " \(String(format: "%.2f", data))"
        outputTextLable.text = newValueForLable
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

