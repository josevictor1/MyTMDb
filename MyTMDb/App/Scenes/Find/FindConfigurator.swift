//
//  FindConfigurator.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 12/01/19.
//  Copyright (c) 2019 José Victor Pereira Costa. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension FindInteractor: FindViewControllerOutput, FindRouterDataSource, FindRouterDataDestination {
}

extension FindPresenter: FindInteractorOutput {
}

class FindConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = FindConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: FindViewController) {
        
        let presenter = FindPresenter()
        presenter.output = viewController
        
        let interactor = FindInteractor()
        interactor.output = presenter
        
        let router = FindRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}