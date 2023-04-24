//
//  Int+CommaSeparatedYen.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/24.
//

import Foundation

extension Int {
    func commaSeparatedYen() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
