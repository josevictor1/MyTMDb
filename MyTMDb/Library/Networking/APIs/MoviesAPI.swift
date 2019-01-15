//
//  MoviesAPI.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 13/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import Foundation
import Moya

enum MoviesAPI {
    case requestMovies(_ page: Int)
    case requestGenre
}

extension MoviesAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: AppEnvironment.baseMoviesURL)!
    }
    
    var path: String {
        switch self {
        case .requestMovies:
            return "/3/movie/upcoming"
        case .requestGenre:
            return "/3/genre/movie/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .requestMovies, .requestGenre:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .requestMovies(let page):
            return .requestParameters(parameters: ["api_key": AppEnvironment.apiKey, "language": "en-US", "page" : "\(page)"], encoding: URLEncoding.queryString)
        case .requestGenre:
            return .requestParameters(parameters: ["api_key": AppEnvironment.apiKey, "language": "en-US"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
