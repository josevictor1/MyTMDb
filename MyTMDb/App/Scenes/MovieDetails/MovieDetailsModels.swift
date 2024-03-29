//
//  MovieDetailsModels.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 12/01/19.
//  Copyright (c) 2019 José Victor Pereira Costa. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates
//
//  Type "usecase" for some magic!

import UIKit

struct MovieDetailsScene {
    struct MovieDetail {
        
        struct Request {
            
        }
        
        struct Response {
            let result: Result
        }
        
        struct ViewModel {
            struct MovieDetails {
                let name: String
                let genre: String
                let overview: String
                let posterImage: UIImage
                let backDropImage: UIImage
                let releaseDate: String
            }
            
            let movieDetails: MovieDetails
        }
    }
    
    struct Genres {
        struct Request { }
        
        struct Response {
            let genresList: GenreModel
        }
    }
}
