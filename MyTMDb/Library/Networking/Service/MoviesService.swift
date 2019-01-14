//
//  MoviesService.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 13/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import Foundation
import Moya
import RxSwift

enum RequestError: Error {
    
    case serverError
    case underlyingError(Error)
}

extension RequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .serverError:
            return """
            An error occour in server connection. Try later.
            """
        case .underlyingError(let error):
            return error.localizedDescription
        }
    }
}

struct MoviewService {
    
    let provider: MoyaProvider<MoviesAPI>
    
    init(provider: MoyaProvider<MoviesAPI> = MoyaProvider()) {
        self.provider = provider
    }
    
    func requestMovies(at page: Int) -> Single<MoviesModel> {
        return provider.rx.request(.requestMovies(page))
                .filter(statusCode: 200)
                .catchError { error in
                    try self.handleError(error)
                    return Observable.empty().asSingle()
                }
                .map(MoviesModel.self)
        
    }
    
    private func handleError(_ error: Error) throws {
        throw RequestError.serverError
    }
}
