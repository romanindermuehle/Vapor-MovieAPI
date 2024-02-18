//
//  Movie.swift
//
//
//  Created by Roman Indermühle on 15.02.2024.
//

import Foundation
import Vapor
import Fluent

final class Movie: Model, Content {
    
    static let schema = "movies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "year")
    var year: Int
    
    
    init() {}
    
    init(id: UUID? = nil, title: String, year: Int) {
        self.id = id
        self.title = title
        self.year = year
    }
}
