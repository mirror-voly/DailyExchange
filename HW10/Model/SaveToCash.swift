//
//  SaveToCash.swift
//  HW10
//
//  Created by Nur on 1/1/24.
//

import Foundation

class StorageManager {
    
    static func saveToCash() {
        guard let dataEncoder = try? JSONEncoder().encode(Valute.valutes) else { return }
        UserDefaults.standard.setValue(dataEncoder, forKey: "savedData")
        let dateOfUpdate = Corrency.date
        UserDefaults.standard.set(dateOfUpdate, forKey: "date")
        print(dataEncoder, "is saved")
    }

    static func loadFromCash() {
        guard let savedData = UserDefaults.standard.object(forKey: "savedData") as? Data else {
            return }
        guard let dataDecode = try? JSONDecoder().decode([Valute].self,
                                                         from: savedData) else { return }
        guard let lastDate = UserDefaults.standard.string(forKey: "date") else { return }
        if !dataDecode.isEmpty {
            Corrency.date = lastDate
            Valute.valutes = dataDecode
            print(savedData, "is loaded")
        }
            
    }
}

