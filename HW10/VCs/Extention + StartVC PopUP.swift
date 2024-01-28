//
//  Extention + StartVC PopUP.swift
//  HW10
//
//  Created by Nur on 1/28/24.
//

import UIKit
extension StartViewController {

    func setPopUpButtone() {
        let optionClosure = { (action : UIAction) in
            if action.title == "-" {
                Valute.chosenValute = nil
                self.outputTextLable.text = " -"
                self.popUpButtone.setTitleColor(.gray, for: .normal)
            }
            else {
                self.popUpButtone.setTitleColor(.orange, for: .normal)
            }
            let valute = self.findValue(action.title)
            guard let valute = valute else { return }
            self.valuteManager(valute)
            if self.inputTextField.text == "" {
                let charCode = valute.charCode
                self.outputTextLable.text = charCode
            }
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
}
