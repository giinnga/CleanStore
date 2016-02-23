//
//  ListOrdersInteractorTests.swift
//  CleanStore
//
//  Created by Victor Souza on 2/18/16.
//  Copyright (c) 2016 Victor Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import CleanStore
import XCTest

class ListOrdersInteractorTests: XCTestCase {
    
    // MARK: Subject under test
    
    var sut: ListOrdersInteractor!
    
    // MARK: Test lifecycle
  
    override func setUp() {
        
        super.setUp()
        setupListOrdersInteractor()
    }
  
    override func tearDown() {
        
        super.tearDown()
    }
  
    // MARK: Test setup
  
    func setupListOrdersInteractor() {
        
        sut = ListOrdersInteractor()
    }
  
    // MARK: Test doubles
    
    class ListOrdersInteractorOutputSpy: ListOrdersInteractorOutput {
        
        // MARK: Method call expectations
        var presentFetchedOrdersCalled = false
        
        // MARK: Spied methods
        func presentFetchedOrders(response: ListOrders_FetchOrders_Response) {
            
            presentFetchedOrdersCalled = true
        }
    }
    
    class OrdersWorkerSpy: OrdersWorker {
        
        // MARK: Method call expectations
        var fetchOrdersCalled = false
        
        // MARK: Spied methods
        override func fetchOrders(completionHandler: (orders: [Order]) -> Void) {
            
            fetchOrdersCalled = true
            completionHandler(orders: [])
        }
    }
  
    // MARK: Tests
    
    func testFetchOrdersShouldAskOrdersWorkerToFetchOrdersAndPresenterToFormatResult() {
        
        // Given
        let listOrdersInteractorOutputSpy = ListOrdersInteractorOutputSpy()
        sut.output = listOrdersInteractorOutputSpy
        let ordersWorkerSpy = OrdersWorkerSpy(ordersStore: OrdersMemStore())
        sut.ordersWorker = ordersWorkerSpy
        
        // When
        let request = ListOrders_FetchOrders_Request()
        sut.fetchOrders(request)
        
        // Then
        XCTAssert(ordersWorkerSpy.fetchOrdersCalled, "FetchOrders() should ask OrdersWorker to fetch orders")
        XCTAssert(listOrdersInteractorOutputSpy.presentFetchedOrdersCalled, "FetchOrders() should ask presenter to format orders result")
    }
}
