//
//  CreateOrderPresenterTests.swift
//  CleanStore
//
//  Created by Victor Souza on 2/17/16.
//  Copyright © 2016 Victor Souza. All rights reserved.
//

@testable import CleanStore
import XCTest
import UIKit

class CreateOrderPresenterTests: XCTestCase {
    
    // Subject under test
    var createOrderPresenter: CreateOrderPresenter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        setupCreateOrderPresenter()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCreateOrderPresenter() {
        
        createOrderPresenter = CreateOrderPresenter()
    }
    
    //MARK: Test doubles
    
    class CreateOrderPresenterOutputMock: CreateOrderPresenterOutput {
        
        // MARK: Method call expectations
        var displayExpirationDateCalled = false
        
        // MARK: Argument expectations
        var createOrder_formatExpirationDate_viewModel: CreateOrder_FormatExpirationDate_ViewModel!
        
        // MARK: Spied methods
        func displayExpirationDate(viewModel: CreateOrder_FormatExpirationDate_ViewModel) {
            
            displayExpirationDateCalled = true
            createOrder_formatExpirationDate_viewModel = viewModel
        }
        
        // MARK: Verifications
        func verifyDisplayExpirationDateIsCalled() -> Bool {
            
            return displayExpirationDateCalled
        }
        
        func verifyExpirationDateIsFormattedAs(date: String) -> Bool {
            
            return createOrder_formatExpirationDate_viewModel.date == date
        }
    }
    
    // MARK: Test methods
    
    func testPresentExpirationDateShouldConvertDateToString() {
        
        // Given
        let createOrderPresenterOutputMock = CreateOrderPresenterOutputMock()
        createOrderPresenter.output = createOrderPresenterOutputMock
        
        let dateComponents = NSDateComponents()
        dateComponents.year = 2007
        dateComponents.month = 6
        dateComponents.day = 29
        let date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
        let response = CreateOrder_FormatExpirationDate_Response(date: date)
        
        // When
        createOrderPresenter.presentExpirationDate(response)
        
        // Then
        let expectedDate = "6/29/07"
        XCTAssert(createOrderPresenterOutputMock.verifyExpirationDateIsFormattedAs(expectedDate), "Presenting an expiration date should convert date to string")
    }
    
    func testPresentExpirationDateShouldAskViewControllerToDisplayDateString() {
        
        // Given
        let createOrderPresenterOutputMock = CreateOrderPresenterOutputMock()
        createOrderPresenter.output = createOrderPresenterOutputMock
        let response = CreateOrder_FormatExpirationDate_Response(date: NSDate())
        
        // When
        createOrderPresenter.presentExpirationDate(response)
        
        // Then
        XCTAssert(createOrderPresenterOutputMock.verifyDisplayExpirationDateIsCalled(), "Presenting an expiration date should ask view controller to display date string")
    }
}
