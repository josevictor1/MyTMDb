//
//  MoviesPresenter.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 12/01/19.
//  Copyright (c) 2019 José Victor Pereira Costa. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol MoviesPresenterInput {
    func presentMovies(with response: MoviesScene.Movies.Response)
    func presentMovies(with error: Error)
}

protocol MoviesPresenterOutput: class {
    func display(with result: MoviesScene.Movies.ViewModel)
    func display(with error: String)
}

typealias ViewModel = MoviesScene.Movies.ViewModel
typealias MovieInformation = MoviesScene.Movies.ViewModel.MovieInformation

class MoviesPresenter: MoviesPresenterInput {

    weak var output: MoviesPresenterOutput?
    
    // MARK: Presentation logic
    func presentMovies(with response: MoviesScene.Movies.Response) {
        guard let movies = response.movies.results else { return }
        output?.display(with: fillViewModel(with: movies))
    }

    func presentMovies(with error: Error) {
        
    }
    
    private func fillViewModel(with model: [Result]) -> ViewModel {
        var movies: [MovieInformation] = []
        
        model.forEach { (result) in
            movies.append(MovieInformation(posterImage: getImage(with: result.posterPath ?? "")))
        }
        
        return ViewModel(movies: movies)
    }
    
   
    
    private func getImage(with path: String) -> UIImage {
        let url = URL(string: AppEnvironment.baseImagesURL + path)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data, let image = UIImage(data: imageData) {
            return image
        }
        
        return UIImage()
    }
}
