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
        
        let value = Valute.valutes[indexPath.row].value!
        let roundedValue = String(format: "%.2f", value)
        cell.LableRight.text = "\(roundedValue)₽"
        
        if Valute.valutes[indexPath.row].nominal! > 1 {
            cell.LableRightValuteCouter.isHidden = false
            cell.LableRightValuteCouter.text = "\(String(Valute.valutes[indexPath.row].nominal!)) x"
        } else {
            cell.LableRightValuteCouter.isHidden = true
        }
        
        guard let previous = Valute.valutes[indexPath.row].previous else
        { return cell }
       
        if value > previous {
            cell.LableRightDown.text = "▲"
            cell.LableRightDown.textColor = .red
        } else if value < previous {
            cell.LableRightDown.text = "▼"
            cell.LableRightDown.textColor = .green
        } else {
            cell.LableRightDown.text = "-"
            cell.LableRightDown.textColor = .gray
        }

        return cell
    }
}
