//
//  CalculationAppTests.swift
//  CalculationAppTests
//
//  Created by 山崎定知 on 2023/04/22.
//

import XCTest
@testable import CalculationApp

final class CalculationAppTests: XCTestCase {
    var investmentAsset1: InvestmentAsset!
    var investmentAsset2: InvestmentAsset!
    var investmentAsset3: InvestmentAsset!
    
    override func setUp() {
        super.setUp()
        investmentAsset1 = InvestmentAsset(initialInvestmentAmount: 1000000, monthlyInvestmentAmount: 100000, annualInterestRate: 0.24, investmentYears: 10)
        investmentAsset2 = InvestmentAsset(initialInvestmentAmount: 0, monthlyInvestmentAmount: 100000, annualInterestRate: 0.24, investmentYears: 50)
        investmentAsset3 = InvestmentAsset(initialInvestmentAmount: 100000, monthlyInvestmentAmount: 100000, annualInterestRate: 0, investmentYears: 50)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCalculateTotalAmount() {
        
        let result = investmentAsset1.finalValue
        XCTAssertEqual(result, 59590979)
    }
    
    func testCalculateTotalAmount2() {
        
        let result = investmentAsset2.finalValue
        XCTAssertEqual(result, 722886405604)
    }
    
    func testCalculateTotalAmount3() {
        
        let result = investmentAsset3.finalValue
        XCTAssertEqual(result, 60100000)
    }

}
