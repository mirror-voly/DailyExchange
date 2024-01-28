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
    @IBOutlet var reverseButtone: UIButton!
    
    let dataSourseURL = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, 
            .font: UIFont.systemFont(ofSize: 25)]
        inputTextField.attributedPlaceholder = NSAttributedString(string: "₽",
                                                                  attributes: attributes)
        self.popUpButtone.setTitleColor(.gray, for: .normal)
        inputTextField.setLeftPaddingPoints(10)
        setTextFieldsDefaoultParametrs()
        
        StorageManager.loadFromCash()
        isDataLoaded()
        setPopUpButtone()
    }
    
    @IBAction func updateButtonePushed(_ sender: Any) {
        fetchdata()
    }
    
    @IBAction func textFieldHasChanged(_ sender: Any) {
        setupTextFields()
    }
 
    @IBAction func showAllButtonePressed(_ sender: UIButton) {
        if !Valute.valutes.isEmpty {
            performSegue(withIdentifier: "goTwo", sender: self)
        } else {
            self.showErrorAlert()
        }
    }
    
    @IBAction func reverseButtonePressed(_ sender: UIButton) {
        setupReversedValuesByButtone()
    }
}
