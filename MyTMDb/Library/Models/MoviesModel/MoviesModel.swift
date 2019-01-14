//
//  MoviesModel.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 13/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import Foundation

struct MoviesModel: Codable {
    let results: [Result]?
    let page: Int?
    let totalResults: Int?
    let dates: Dates?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalResults = "total_results"
        case dates = "dates"
        case totalPages = "total_pages"
    }
}

struct Dates: Codable {
    let maximum: String?
    let minimum: String?
    
    enum CodingKeys: String, CodingKey {
        case maximum = "maximum"
        case minimum = "minimum"
    }
}

struct Result: Codable {
    let voteCount: Int?
    let id: Int?
    let video: Bool?
    let voteAverage: Double?
    let title: String?
    let popularity: Double?
    let posterPath: String?
    let originalLanguage: OriginalLanguage?
    let originalTitle: String?
    let genreIds: [Int]?
    let backdropPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id = "id"
        case video = "video"
        case voteAverage = "vote_average"
        case title = "title"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult = "adult"
        case overview = "overview"
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
}

// MARK: Convenience initializers and mutators

extension MoviesModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MoviesModel.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        results: [Result]?? = nil,
        page: Int?? = nil,
        totalResults: Int?? = nil,
        dates: Dates?? = nil,
        totalPages: Int?? = nil
        ) -> MoviesModel {
        return MoviesModel(
            results: results ?? self.results,
            page: page ?? self.page,
            totalResults: totalResults ?? self.totalResults,
            dates: dates ?? self.dates,
            totalPages: totalPages ?? self.totalPages
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Dates {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Dates.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        maximum: String?? = nil,
        minimum: String?? = nil
        ) -> Dates {
        return Dates(
            maximum: maximum ?? self.maximum,
            minimum: minimum ?? self.minimum
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        voteCount: Int?? = nil,
        id: Int?? = nil,
        video: Bool?? = nil,
        voteAverage: Double?? = nil,
        title: String?? = nil,
        popularity: Double?? = nil,
        posterPath: String?? = nil,
        originalLanguage: OriginalLanguage?? = nil,
        originalTitle: String?? = nil,
        genreIds: [Int]?? = nil,
        backdropPath: String?? = nil,
        adult: Bool?? = nil,
        overview: String?? = nil,
        releaseDate: String?? = nil
        ) -> Result {
        return Result(
            voteCount: voteCount ?? self.voteCount,
            id: id ?? self.id,
            video: video ?? self.video,
            voteAverage: voteAverage ?? self.voteAverage,
            title: title ?? self.title,
            popularity: popularity ?? self.popularity,
            posterPath: posterPath ?? self.posterPath,
            originalLanguage: originalLanguage ?? self.originalLanguage,
            originalTitle: originalTitle ?? self.originalTitle,
            genreIds: genreIds ?? self.genreIds,
            backdropPath: backdropPath ?? self.backdropPath,
            adult: adult ?? self.adult,
            overview: overview ?? self.overview,
            releaseDate: releaseDate ?? self.releaseDate
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
