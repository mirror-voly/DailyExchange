//
//  SaveToCash.swift
//  HW10
//
//  Created by Nur on 1/1/24.
//

import Foundation

class StorageManager {
    
    private let shared = StorageManager()
    
    static func saveToCash() {
        guard let dataEncoder = try? JSONEncoder().encode(Corrency.valutes) else { return }
        UserDefaults.standard.setValue(dataEncoder, forKey: "savedData")
        print(dataEncoder, "is saved")
    }

    static func loadFromCash() {
        guard let savedData = UserDefaults.standard.object(forKey: "savedData") as? Data else {
            return }
        guard let dataDecode = try? JSONDecoder().decode([Valute].self,
                                                         from: savedData) else { return }
        if !dataDecode.isEmpty {
            Corrency.valutes = dataDecode
            print(savedData, "is loaded")
        }
            
    }
}

