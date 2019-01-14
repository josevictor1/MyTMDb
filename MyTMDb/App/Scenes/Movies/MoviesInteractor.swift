//
//  MoviesInteractor.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 12/01/19.
//  Copyright (c) 2019 José Victor Pereira Costa. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol MoviesInteractorInput {
    
}

protocol MoviesInteractorOutput {
    
}

protocol MoviesDataSource {
    var selectedMovie: MoviesModel! { get }
}

protocol MoviesDataDestination {
    
}

class MoviesInteractor: MoviesInteractorInput, MoviesDataSource, MoviesDataDestination {
    
    var output: MoviesInteractorOutput?
    var selectedMovie: MoviesModel!
    // MARK: Business logic
    
    
    

}
