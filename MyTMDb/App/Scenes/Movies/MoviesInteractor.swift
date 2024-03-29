//
//  MoviesInteractor.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 12/01/19.
//  Copyright (c) 2019 José Victor Pereira Costa. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import RxSwift

protocol MoviesInteractorInput {
    func requestMovies(with request: MoviesScene.Movies.Request)
    func selectUser(with index: Int)
}

protocol MoviesInteractorOutput {
    func presentMovies(with response: MoviesScene.Movies.Response)
    
    func presentMovies(with error: Error)
}

protocol MoviesDataSource {
    var selectedMovie: Result? { get }
}

protocol MoviesDataDestination {
    
}

class MoviesInteractor: MoviesInteractorInput, MoviesDataSource, MoviesDataDestination {
    
    
 
    var output: MoviesInteractorOutput?
    var selectedMovie: Result?
    var moviesWorker: MoviesWorker!
    let disposeBag = DisposeBag()
    var moviesList: [Result] = []
    var pageCounter: Int = 1
    // MARK: Business logic
    
    init(moviesWorker: MoviesWorker = MoviesWorker()) {
        self.moviesWorker = moviesWorker
    }
    
    func requestMovies(with request: MoviesScene.Movies.Request) {
        guard pageCounter <= 1000 else {
            return
        }
        
        moviesWorker.getMovies(pageCounter).subscribe { event in
            switch event {
            case .success(let movies):
                let response  = MoviesScene.Movies.Response(movies: movies)
                self.output?.presentMovies(with: response)
                if let results = response.movies.results  {
                    self.moviesList += results
                }
            case .error(let error):
                self.output?.presentMovies(with: error)
            }
        }
        .disposed(by: disposeBag)
        pageCounter+=1
    }
    
    func selectUser(with index: Int) {
        selectedMovie = moviesList[index]
    }

}
