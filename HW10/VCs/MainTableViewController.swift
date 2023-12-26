//
//  MainTableViewController.swift
//  HW10
//
//  Created by Nur on 12/25/23.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var coursCharCodes: [String] = []
    var coursTest: [Valute] = []

    
    @IBOutlet var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSettings.rowHeight = 80
        tableViewSettings.separatorColor = .black
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sumOfValutes = Corrency.counter
        return sumOfValutes
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        
        cell.LableLeft.text = coursCharCodes[indexPath.row]
        cell.LableSenter.text = coursTest[indexPath.row].name
        let value = Int(coursTest[indexPath.row].value!)
        cell.LableRight.text = (String(value)) + "₽"
        let previous = Int(coursTest[indexPath.row].previous!)
        if value > previous {
            cell.LableRightDown.text = "▲"
        } else {
            cell.LableRightDown.text = "▼"
        }

        return cell
    }
}
