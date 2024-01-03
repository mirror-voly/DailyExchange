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
                Corrency.date = "Актуальные данные от - \(corency.timestamp?.replacingOccurrences(of: "T", with: " ").replacingOccurrences(of: "+03:00", with: " по МСК") ?? "Error, can't find timestamp")"
                DispatchQueue.main.async {
                    self.dateLable.text = Corrency.date
                    self.showAlert()
                }
                StorageManager.saveToCash()
            } catch let error {
                print(error)
            }
        }
        dataTask.resume()
    }
    
    func isDataLoaded() {
        if Valute.valutes .isEmpty {
            fetchdata()
        } else {
            self.dateLable.text = Corrency.date
        }
    }
    func showAlert() {
        let alert = UIAlertController(title: nil, message: "Обновлено", preferredStyle: .actionSheet)
        self.present(alert, animated: false, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in alert.dismiss(animated: false, completion: nil)} )
    }
}

