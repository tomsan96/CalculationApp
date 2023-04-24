//
//  InputItemView.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/22.
//

import SwiftUI

struct InputItemView: View {
    let unit: Unit
    @State var labelName: String
    @Binding var number: Int?

    var body: some View {
        VStack(alignment: .leading) {
            Text(labelName)
            HStack {
                TextField("", value: $number, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                Text(unit.rawValue)
            }
        }
    }
}

struct InputItemView_Previews: PreviewProvider {
    static var previews: some View {
        InputItemView(unit: .tenThousandYen, labelName: "初期投資額", number: .constant(10))
    }
}