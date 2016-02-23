//
//  CreateOrderInteractorTests.swift
//  CleanStore
//
//  Created by Victor Souza on 2/17/16.
//  Copyright © 2016 Victor Souza. All rights reserved.
//

@testable import CleanStore
import UIKit
import XCTest

class CreateOrderInteractorTests: XCTestCase {
    
    // Subject under test
    var createOrderInteractor: CreateOrderInteractor!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        setupCreateOrderInteractor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCreateOrderInteractor() {
        
        createOrderInteractor = CreateOrderInteractor()
    }
    
    // MARK: Test doubles
    
    class CreateOrderInteractorOutputSpy: CreateOrderInteractorOutput {
        
        var presentExpirationDateCalled = false
        
        func presentExpirationDate(response: CreateOrder_FormatExpirationDate_Response) {
            
            presentExpirationDateCalled = true
        }
    }
    
    // MARK: Test expiration date
    
    func testFormatExpirationDateShouldAskPresenterToFormatExpirationDate() {
        
        // Given
        let request = CreateOrder_FormatExpirationDate_Request(date: NSDate())
        let createOrderInteractorOutputSpy = CreateOrderInteractorOutputSpy()
        createOrderInteractor.output = createOrderInteractorOutputSpy
        
        // When
        createOrderInteractor.formatExpirationDate(request)
        
        // Then
        XCTAssert(createOrderInteractorOutputSpy.presentExpirationDateCalled, "Formatting an expiration date should ask presenter to do it")
    }
    
    // MARK: Test shipping methods
    
    func testShippingMethodsShouldReturnAllAvailableShippingMethods() {
        
        // Given
        let allAvailableShippingMethods = [
            "Standard Shipping",
            "Two-Day Shipping",
            "One-Day Shipping"
        ]
        
        // When
        let returnedShippingMethods = createOrderInteractor.shippingMethods
        
        // Then
        XCTAssertEqual(returnedShippingMethods, allAvailableShippingMethods, "Shipping Methods should list all available shipping methods")
    }
}
