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
                Corrency.valutes.removeAll()
                Corrency.valutes.append(contentsOf: corency.valute!.values)
                DispatchQueue.main.async {
                    self.dateLable.text = "Updated at \(corency.date ?? "")"
                }
                StorageManager.saveToCash()
            } catch let error {
                print(error)
            }
        }
        dataTask.resume()
    }
    
    func isDataLoaded() {
        if Corrency.valutes .isEmpty {
            fetchdata()
        }
    }
}

