//
//  MoviesRouter.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 12/01/19.
//  Copyright (c) 2019 José Victor Pereira Costa. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol MoviesRouterInput {
    func navigateMovieDetail()
}

protocol MoviesRouterDataSource: class {
    var selectedMovie: Result? { get }
}

protocol MoviesRouterDataDestination: class {
    
}


class MoviesRouter: MoviesRouterInput {
   
    weak var viewController: MoviesViewController!
    weak private var dataSource: MoviesRouterDataSource!
    weak var dataDestination: MoviesRouterDataDestination!
    
    init(viewController: MoviesViewController, dataSource: MoviesRouterDataSource, dataDestination: MoviesRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    func navigateMovieDetail() {
        viewController.performSegue(withIdentifier: "MovieDetails", sender: viewController)
    }
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
        if let movieDetailsViewController = segue.destination as? MovieDetailsViewController {
            movieDetailsViewController.router?.dataDestination.movieDetails = dataSource.selectedMovie
        }
    }
}
