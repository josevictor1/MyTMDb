//
//  GenreModel.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 15/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import Foundation

struct GenreModel: Codable {
    let genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
}

struct Genre: Codable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

// MARK: Convenience initializers and mutators

extension GenreModel {
    init(data: Data) throws {
        self = try JSONDecoder().decode(GenreModel.self, from: data)
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
        genres: [Genre]?? = nil
        ) -> GenreModel {
        return GenreModel(
            genres: genres ?? self.genres
        )
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
