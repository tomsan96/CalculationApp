//
//  OutputItemView.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/22.
//

import SwiftUI

struct OutputItemView: View {
    let unit: Unit
    @State var title: String
    @Binding var number: Int?

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(verbatim: "\((number ?? 0).commaSeparatedYen())\(unit.rawValue)")
        }
    }
}

struct OutputItemView_Previews: PreviewProvider {
    static var previews: some View {
        OutputItemView(unit: .yen, title: "合計金額", number: .constant(10000000))
    }
}
