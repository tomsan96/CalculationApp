//
//  CalculationAppTests.swift
//  CalculationAppTests
//
//  Created by 山崎定知 on 2023/04/22.
//

import XCTest
@testable import CalculationApp

final class CalculationAppTests: XCTestCase {
    var investmentAsset1 = InvestmentAsset()
    var investmentAssetWithNoAnnualInterestRatePercent = InvestmentAsset()
    
    override func setUp() {
        super.setUp()

        investmentAsset1.initialInvestmentAmountWithTenThousandYen = 100
        investmentAsset1.monthlyInvestmentAmountWithTenThousandYen = 10
        investmentAsset1.annualInterestRatePercent = 24
        investmentAsset1.investmentYears = 10
        
        investmentAssetWithNoAnnualInterestRatePercent.initialInvestmentAmountWithTenThousandYen = 10
        investmentAssetWithNoAnnualInterestRatePercent.monthlyInvestmentAmountWithTenThousandYen = 10
        investmentAssetWithNoAnnualInterestRatePercent.annualInterestRatePercent = 0
        investmentAssetWithNoAnnualInterestRatePercent.investmentYears = 50

    }

    func testCalculateTotalAmount() {
        
        let result = investmentAsset1.calculateFinalTotalAmount()
        XCTAssertEqual(result, 59590979)
    }
    
    func testCalculateTotalAmountWithNoAnnualInterestRatePercent() {
        
        let result = investmentAssetWithNoAnnualInterestRatePercent.calculateFinalTotalAmount()
        XCTAssertEqual(result, 60100000)
    }

}
