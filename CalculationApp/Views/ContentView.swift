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
    @State var capital: Int?
    @State var investmentIncome: Int?
    @State var isShowingSheet = false
    @FocusState var isTextFieldFocused: UUID?
    var isDisabledCalculateButton: Bool {
        return investmentAsset.initialInvestmentAmountWithTenThousandYen == nil
        || investmentAsset.monthlyInvestmentAmountWithTenThousandYen == nil
        || investmentAsset.annualInterestRatePercent == nil
        || investmentAsset.investmentYears == nil
    }

    var body: some View {
        VStack {
            InputItemView(unit: .tenThousandYen, labelName: "初期投資額", number: $investmentAsset.initialInvestmentAmountWithTenThousandYen, isFocused: $isTextFieldFocused)
            InputItemView(unit: .tenThousandYen, labelName: "毎月の積み立て金額", number: $investmentAsset.monthlyInvestmentAmountWithTenThousandYen, isFocused: $isTextFieldFocused)
            InputItemView(unit: .percent, labelName: "想定利回り(年率)", number: $investmentAsset.annualInterestRatePercent, isFocused: $isTextFieldFocused)
            InputItemView(unit: .years, labelName: "積み立て期間", number: $investmentAsset.investmentYears, isFocused: $isTextFieldFocused)
            Button("計算する") {
                finalTotalAmount = investmentAsset.calculateFinalTotalAmount()
                capital = investmentAsset.calculateCapital()
                investmentIncome = investmentAsset.calculateInvestmentIncome()
                isTextFieldFocused = nil
            }
            .buttonStyle(.borderedProminent)
            .disabled(isDisabledCalculateButton)
            .padding(.vertical, 12)
            OutputItemView(unit: .yen, title: "将来の資産合計金額", number: $finalTotalAmount)
            OutputItemView(unit: .yen, title: "元本", number: $capital)
            OutputItemView(unit: .yen, title: "運用収益", number: $investmentIncome)
            Button("免責事項") {
                isShowingSheet.toggle()
            }
            .sheet(isPresented: $isShowingSheet) {
                DisclaimerView()
            }
            .padding(.top, 12)
        }
        .padding()
        .onTapGesture {
            isTextFieldFocused = nil
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
