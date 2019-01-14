//
//  AppEnvironment.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 13/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import Foundation

struct AppEnvironment {
    
    static var baseMoviesURL: String {
        //https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1
        return "https://api.themoviedb.org"
    }
    
    static var baseImagesURL: String {
        //https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
        return "https://image.tmdb.org"
    }
    
    static var apiKey: String {
        return "5a94eebd6b43f083c50ee82c524dcee1"
    }
}
