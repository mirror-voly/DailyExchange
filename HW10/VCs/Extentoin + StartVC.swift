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
        let dataTask = URLSession.shared.dataTask(with: url) { [self](data, responce, _) in
            guard let data = data else {
                print(responce ?? "Empty Responce")
                return
            }
            do {
                let checkCorency = try JSONDecoder().decode(Corrency.self, from: data)
                self.preparedDataOfValutes.append(contentsOf: checkCorency.valute!.values)
                Corrency.counter = checkCorency.valute!.values.count
            } catch let error {
                print(error)
            }
        }
        dataTask.resume()
    }
}

