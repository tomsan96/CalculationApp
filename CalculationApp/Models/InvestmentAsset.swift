//
//  InvestmentAsset.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/22.
//
import Foundation

class InvestmentAsset: ObservableObject {
    @Published var initialInvestmentAmountWithTenThousandYen: Int?
    var initialInvestmentAmount: Int? {
        guard let initialInvestmentAmountWithTenThousandYen = initialInvestmentAmountWithTenThousandYen else { return nil }
        return initialInvestmentAmountWithTenThousandYen * 10000
    }
    @Published var monthlyInvestmentAmountWithTenThousandYen: Int?
    var monthlyInvestmentAmount: Int? {
        guard let monthlyInvestmentAmountWithTenThousandYen = monthlyInvestmentAmountWithTenThousandYen else { return nil }
        return monthlyInvestmentAmountWithTenThousandYen * 10000
    }
    @Published var annualInterestRatePercent: Int?
    var annualInterestRate: Double? {
        guard let annualInterestRatePercent = annualInterestRatePercent else { return nil }
        return Double(annualInterestRatePercent) / 100
    }
    var monthlyInterestRate: Double? {
        guard let annualInterestRate = annualInterestRate else { return nil }
        return Double(annualInterestRate) / 12
    }
    @Published var investmentYears: Int?
    var investMonths: Int? {
        guard let investmentYears = investmentYears else { return nil }
        return investmentYears * 12
    }

    func calculateFinalTotalAmount() -> Int? {
        guard let initialInvestmentAmount = initialInvestmentAmount,
              let monthlyInvestmentAmount = monthlyInvestmentAmount,
              let monthlyInterestRate = monthlyInterestRate,
              let investMonths = investMonths else { return nil }
        var visits = 0
        if monthlyInterestRate != 0 {
            visits = Int(ceil(Double(initialInvestmentAmount) * pow(1 + monthlyInterestRate, Double(investMonths)) + Double(monthlyInvestmentAmount) * (pow(1 + monthlyInterestRate, Double(investMonths)) - 1) / monthlyInterestRate))
        } else {
            visits = initialInvestmentAmount + (monthlyInvestmentAmount * investMonths)
        }
        return visits
    }
    
    func calculateCapital() -> Int? {
        guard let monthlyInvestmentAmount = monthlyInvestmentAmount,
              let investMonths = investMonths,
              let initialInvestmentAmount = initialInvestmentAmount else { return nil }
        return monthlyInvestmentAmount * investMonths + initialInvestmentAmount
    }
    
    func calculateInvestmentIncome() -> Int? {
        guard let finalTotalAmount = calculateFinalTotalAmount(),
              let capital = calculateCapital() else { return nil }
        return finalTotalAmount - capital
    }
}
