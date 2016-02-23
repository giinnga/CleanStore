//
//  ListOrdersConfigurator.swift
//  CleanStore
//
//  Created by Victor Souza on 2/18/16.
//  Copyright (c) 2016 Victor Souza. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension ListOrdersViewController: ListOrdersPresenterOutput {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        router.passDataToNextScene(segue)
    }
}

extension ListOrdersInteractor: ListOrdersViewControllerOutput {
    
}

extension ListOrdersPresenter: ListOrdersInteractorOutput {
    
}

class ListOrdersConfigurator {
    
    // MARK: Object lifecycle
    
    class var sharedInstance: ListOrdersConfigurator {
        
        struct Static {
            static var instance: ListOrdersConfigurator?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ListOrdersConfigurator()
        }
        
        return Static.instance!
    }
    
    // MARK: Configuration
  
    func configure(viewController: ListOrdersViewController) {
        
        let router = ListOrdersRouter()
        router.viewController = viewController
    
        let presenter = ListOrdersPresenter()
        presenter.output = viewController
    
        let interactor = ListOrdersInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
