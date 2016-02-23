//
//  ListOrdersModels.swift
//  CleanStore
//
//  Created by Victor Souza on 2/18/16.
//  Copyright (c) 2016 Victor Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct ListOrdersRequest {
    
}

struct ListOrders_FetchOrders_Request {
    
    
}

struct ListOrdersResponse {
    
}

struct ListOrders_FetchOrders_Response {
    
    var orders: [Order]
}

struct ListOrdersViewModel {
    
}

struct ListOrders_FetchOrders_ViewModel {
    
    struct DisplayedOrder {
        
        var id: String
        var date: String
        var email: String
        var name: String
        var total: String
    }
    var displayedOrders: [DisplayedOrder]
}
