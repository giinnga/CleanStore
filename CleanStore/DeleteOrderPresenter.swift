//
//  DeleteOrderPresenter.swift
//  CleanStore
//
//  Created by Victor Souza on 2/19/16.
//  Copyright (c) 2016 Victor Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol DeleteOrderPresenterInput {
    
    func presentSomething(response: DeleteOrderResponse)
}

protocol DeleteOrderPresenterOutput: class {
    
    func displaySomething(viewModel: DeleteOrderViewModel)
}

class DeleteOrderPresenter: DeleteOrderPresenterInput {
    
    weak var output: DeleteOrderPresenterOutput!
  
    // MARK: Presentation logic
  
    func presentSomething(response: DeleteOrderResponse) {
        
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    
        let viewModel = DeleteOrderViewModel()
        output.displaySomething(viewModel)
    }
}
