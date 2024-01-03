//
//  MainTableViewController.swift
//  HW10
//
//  Created by Nur on 12/25/23.
//

import UIKit

class MainTableViewController: UITableViewController {

    
    @IBOutlet var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSettings.rowHeight = 80
        tableViewSettings.separatorColor = .black
        Valute.valutes.sort {
            $0.charCode! < $1.charCode!
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Valute.valutes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        
        cell.LableLeft.text = Valute.valutes[indexPath.row].charCode
        cell.LableSenter.text = Valute.valutes[indexPath.row].name
        
        let value = Int(Valute.valutes[indexPath.row].value!)
        cell.LableRight.text = (String(value)) + "₽"
        
        if Valute.valutes[indexPath.row].nominal! > 1 {
            cell.LableRightValuteCouter.isHidden = false
            cell.LableRightValuteCouter.text = "\(String(Valute.valutes[indexPath.row].nominal!)) \(Valute.valutes[indexPath.row].charCode ?? "")="
        } else {
            cell.LableRightValuteCouter.isHidden = true
        }
        
        let previous = Int(Valute.valutes[indexPath.row].previous!)
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
