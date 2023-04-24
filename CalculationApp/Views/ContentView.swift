//
//  ContentView.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var investmentAsset = InvestmentAsset()
    @State var finalTotalAmount: Int?
    var body: some View {
        VStack {
            InputItemView(unit: .tenThousandYen, labelName: "初期投資額", number: $investmentAsset.initialInvestmentAmountWithTenThousandYen)
            InputItemView(unit: .tenThousandYen, labelName: "毎月の積み立て金額", number: $investmentAsset.monthlyInvestmentAmountWithTenThousandYen)
            InputItemView(unit: .percent, labelName: "想定利回り(年率)", number: $investmentAsset.annualInterestRatePercent)
            InputItemView(unit: .years, labelName: "積み立て期間", number: $investmentAsset.investmentYears)
            Button("計算する") {
                finalTotalAmount = investmentAsset.calculateFinalTotalAmount()
            }
            OutputItemView(unit: .yen, title: "将来の資産合計金額", number: $finalTotalAmount)
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
