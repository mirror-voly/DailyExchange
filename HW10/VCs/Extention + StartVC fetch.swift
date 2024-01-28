//
//  Extention + StartVC fetch.swift
//  HW10
//
//  Created by Nur on 1/28/24.
//

import Foundation
extension StartViewController {
    
    func fetchdata() {
        guard let url = URL(string: dataSourseURL) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data, error == nil else {
                self.showErrorAlert()
                return
            }
            do {
                let corency = try JSONDecoder().decode(Corrency.self, from: data)
                Valute.valutes.removeAll()
                Valute.valutes.append(contentsOf: corency.valute!.values)
                Corrency.date = "Данные от - \(corency.timestamp?.replacingOccurrences(of: "T", with: " ").replacingOccurrences(of: "+03:00", with: " по МСК") ?? "Error, can't find timestamp")"
                DispatchQueue.main.async {
                    self.dateLable.text = Corrency.date
                }
                StorageManager.saveToCash()
                self.showUpdateAlert()
            } catch let error {
                print(error)
                self.showErrorAlert()
            }
        }
        dataTask.resume()
    }
}

