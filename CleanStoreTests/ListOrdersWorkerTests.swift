//
//  ListOrdersWorkerTests.swift
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

class ListOrdersWorkerTests: XCTestCase {
    
    // MARK: Subject under test
    
    var sut: ListOrdersWorker!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        
        super.setUp()
        setupListOrdersWorker()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
  
    // MARK: Test setup
  
    func setupListOrdersWorker() {
        
        sut = ListOrdersWorker()
    }
    
    // MARK: Test doubles
    
    class OrdersMemStoreSpy: OrdersMemStore {
        
        // MARK: Method call expectations
        var fetchedOrdersCalled = false
        
        // MARK: Spied methods
        override func fetchOrders(completionHandler: (orders: [Order]) -> Void) {
            
            fetchedOrdersCalled = true
            let oneSecond = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
            dispatch_after(oneSecond, dispatch_get_main_queue(), {
                completionHandler(orders: [Order(), Order()])
            })
        }
    }
  
    // MARK: Tests
  
    func testSomething() {
        
        // Given
    
        // When
    
        // Then
    }
}
