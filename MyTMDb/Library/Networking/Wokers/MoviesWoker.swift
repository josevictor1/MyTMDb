//
//  MoviesWoker.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 13/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import Foundation
import Moya
import RxSwift

enum MoviesWorkerWorkerError: Error {
    case missingPageNumber()
}

class MoviesWorker {
    
    let dataSource: MoviesService
    
    init(dataSource: MoviesService = MoviesService()) {
        self.dataSource = dataSource
    }
    
    func getMovies(_ page: Int) -> Single<MoviesModel> {
        return dataSource.requestMovies(at: page)
    }
    
    func getGenres() -> Single<GenreModel> {
        return dataSource.requestGenres()
    }
    
}
