//
//  StartViewController.swift
//  HW10
//
//  Created by Nur on 12/26/23.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet var dateLable: UILabel!
    @IBOutlet var popUpButtone: UIButton!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var outputTextLable: UILabel!
    let dataSourseURL = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.attributedPlaceholder = NSAttributedString(string: "₽", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        StorageManager.loadFromCash()
        isDataLoaded()
        setPopUpButtone()
        self.popUpButtone.setTitleColor(.gray, for: .normal)
    }
    @IBAction func updateButtonePushed(_ sender: Any) {
        fetchdata()
        showAlert()
    }
    
    @IBAction func textFieldHasChanged(_ sender: Any) {
        guard let changedValute = Valute.lustChangedValute else { return }
        if inputTextField.text == "" {
            outputTextLable.text = " -"
        }
        else {
            converValue(changedValute)
        }
        

    }
}
