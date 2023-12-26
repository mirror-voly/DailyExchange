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
        let dataTask = URLSession.shared.dataTask(with: url) { [self](data, _, _) in
            guard let data = data else { return }
            do {
                let checkCorency = try JSONDecoder().decode(Corrency.self, from: data)
                self.coursCharCodes.append(contentsOf: checkCorency.valute!.keys)
                self.coursTest.append(contentsOf: checkCorency.valute!.values)
                Corrency.counter = self.coursCharCodes.count
            } catch let error {
                print(error)
            }
        }
        dataTask.resume()
    }
}

