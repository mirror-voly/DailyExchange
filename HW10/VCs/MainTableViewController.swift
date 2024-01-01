//
//  MainTableViewController.swift
//  HW10
//
//  Created by Nur on 12/25/23.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var coursValutesData: [Valute] = []

    
    @IBOutlet var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSettings.rowHeight = 80
        tableViewSettings.separatorColor = .black
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Corrency.counter
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        
        cell.LableLeft.text = coursValutesData[indexPath.row].charCode
        cell.LableSenter.text = coursValutesData[indexPath.row].name
        
        let value = Int(coursValutesData[indexPath.row].value!)
        cell.LableRight.text = (String(value)) + "₽"
        let previous = Int(coursValutesData[indexPath.row].previous!)
        if value > previous {
            cell.LableRightDown.text = "▲"
            cell.LableRightDown.textColor = .red
        } else {
            cell.LableRightDown.text = "▼"
            cell.LableRightDown.textColor = .green
        }

        return cell
    }
}
