//
//  InvestmentAsset.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/22.
//
import Foundation

class InvestmentAsset: ObservableObject {
    // 初期投資額(万円)
    @Published var initialInvestmentAmountWithTenThousandYen: Int?
    // 初期投資額(円)
    var initialInvestmentAmount: Int? {
        guard let initialInvestmentAmountWithTenThousandYen = initialInvestmentAmountWithTenThousandYen else { return nil }
        return initialInvestmentAmountWithTenThousandYen * 10000
    }
    
    // 毎月の積み立て金額(万円)
    @Published var monthlyInvestmentAmountWithTenThousandYen: Int?
    // 毎月の積み立て金額(円)
    var monthlyInvestmentAmount: Int? {
        guard let monthlyInvestmentAmountWithTenThousandYen = monthlyInvestmentAmountWithTenThousandYen else { return nil }
        return monthlyInvestmentAmountWithTenThousandYen * 10000
    }
    
    // 年利(%)
    @Published var annualInterestRatePercent: Int?
    // 年利
    var annualInterestRate: Double? {
        guard let annualInterestRatePercent = annualInterestRatePercent else { return nil }
        return Double(annualInterestRatePercent) / 100
    }
    // 月利
    var monthlyInterestRate: Double? {
        guard let annualInterestRate = annualInterestRate else { return nil }
        return Double(annualInterestRate) / 12
    }
    
    // 積み立て期間(年)
    @Published var investmentYears: Int?
    // 積み立て期間(月)
    var investMonths: Int? {
        guard let investmentYears = investmentYears else { return nil }
        return investmentYears * 12
    }

    // 将来の資産合計計算
    func calculateFinalTotalAmount() -> Int? {
        guard let initialInvestmentAmount = initialInvestmentAmount,
              let monthlyInvestmentAmount = monthlyInvestmentAmount,
              let monthlyInterestRate = monthlyInterestRate,
              let investMonths = investMonths else { return nil }
        var visits = 0
        if monthlyInterestRate != 0 {
            visits = Int(ceil(
                // 初期投資額の複利計算
                Double(initialInvestmentAmount) * pow(1 + monthlyInterestRate, Double(investMonths)) +
                // 毎月の投資額の複利計算
                Double(monthlyInvestmentAmount) * (pow(1 + monthlyInterestRate, Double(investMonths)) - 1) / monthlyInterestRate
            ))
        } else {
            visits = initialInvestmentAmount + (monthlyInvestmentAmount * investMonths)
        }
        return visits
    }
    
    // 元本の計算
    func calculateCapital() -> Int? {
        guard let monthlyInvestmentAmount = monthlyInvestmentAmount,
              let investMonths = investMonths,
              let initialInvestmentAmount = initialInvestmentAmount else { return nil }
        return monthlyInvestmentAmount * investMonths + initialInvestmentAmount
    }
    
    // 運用収益の計算
    func calculateInvestmentIncome() -> Int? {
        guard let finalTotalAmount = calculateFinalTotalAmount(),
              let capital = calculateCapital() else { return nil }
        return finalTotalAmount - capital
    }
}
