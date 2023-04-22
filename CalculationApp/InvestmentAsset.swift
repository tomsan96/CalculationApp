//
//  Asset.swift
//  CalculationApp
//
//  Created by 山崎定知 on 2023/04/22.
//
import Foundation

struct InvestmentAsset {
    var initialInvestmentAmount: Int
    var monthlyInvestmentAmount: Int
    var annualInterestRate: Double
    var monthlyInterestRate: Double {
        annualInterestRate / 12
    }
    var investmentYears: Int
    var investMonths: Int {
        investmentYears * 12
    }

    var finalValue: Int {
        var visits = 0
        if monthlyInterestRate != 0 {
            visits = Int(ceil(Double(initialInvestmentAmount) * pow(1 + monthlyInterestRate, Double(investMonths)) + Double(monthlyInvestmentAmount) * (pow(1 + monthlyInterestRate, Double(investMonths)) - 1) / monthlyInterestRate))
        } else {
            visits = initialInvestmentAmount + (monthlyInvestmentAmount * investMonths)
        }
        return visits
    }
}
