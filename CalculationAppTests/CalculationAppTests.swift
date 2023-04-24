//
//  CalculationAppTests.swift
//  CalculationAppTests
//
//  Created by 山崎定知 on 2023/04/22.
//

import XCTest
@testable import CalculationApp

final class CalculationAppTests: XCTestCase {
    var investmentAsset = InvestmentAsset()
    var investmentAssetWithNoAnnualInterestRatePercent = InvestmentAsset()
    
    override func setUp() {
        super.setUp()

        investmentAsset.initialInvestmentAmountWithTenThousandYen = 100
        investmentAsset.monthlyInvestmentAmountWithTenThousandYen = 10
        investmentAsset.annualInterestRatePercent = 24
        investmentAsset.investmentYears = 10
        
        investmentAssetWithNoAnnualInterestRatePercent.initialInvestmentAmountWithTenThousandYen = 10
        investmentAssetWithNoAnnualInterestRatePercent.monthlyInvestmentAmountWithTenThousandYen = 10
        investmentAssetWithNoAnnualInterestRatePercent.annualInterestRatePercent = 0
        investmentAssetWithNoAnnualInterestRatePercent.investmentYears = 50

    }

    func testCalculateTotalAmount() {
        
        let result = investmentAsset.calculateFinalTotalAmount()
        XCTAssertEqual(result, 59590979)
    }
    
    func testCalculateTotalAmountWithNoAnnualInterestRatePercent() {
        
        let result = investmentAssetWithNoAnnualInterestRatePercent.calculateFinalTotalAmount()
        XCTAssertEqual(result, 60100000)
    }
    
    func testCalculateCapital() {
        
        let result = investmentAsset.calculateCapital()
        XCTAssertEqual(result, 13000000)
    }
    
    func testCalculateInvestmentIncome() {
        
        let result = investmentAsset.calculateInvestmentIncome()
        XCTAssertEqual(result, 46590979)
    }
    

}
