//
//  StartViewController.swift
//  HW10
//
//  Created by Nur on 12/26/23.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet var dateLable: UILabel!
    let dataSourseURL = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StorageManager.loadFromCash()
        isDataLoaded()
    }
    @IBAction func updateButtonePushed(_ sender: Any) {
        fetchdata()
        showAlert()
    }
    
}
