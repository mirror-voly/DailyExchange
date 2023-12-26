//
//  StartViewController.swift
//  HW10
//
//  Created by Nur on 12/26/23.
//

import UIKit

class StartViewController: UIViewController {
    let dataSourseURL = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    var coursCharCodes: [String] = []
    var coursTest: [Valute] = []
    var coursNames: [String] = []
    var coursValues: [String] = []
    var coursPreviosValues: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goTwo" else { return }
        let destination = segue.destination as! MainTableViewController
        destination.coursCharCodes = coursCharCodes
        destination.coursTest = coursTest
    }
}
