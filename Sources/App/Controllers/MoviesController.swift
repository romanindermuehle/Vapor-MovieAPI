//
//  File.swift
//  
//
//  Created by Roman Indermühle on 15.02.2024.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver


class MoviesController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        
        let api = routes.grouped("api")
        
        // POST: /api/movies
        api.post("movies", use: create)
        
        // GET: /api/movies
        api.get("movies", use: getAll)
        
        // GET: /api/movies/:movieId
        api.get("movies", ":movieId", use: getById)
        
        // DELETE: //api/movies/:movieId
        api.delete("movies", ":movieId", use: deleteMovie)
        
        // PUT: /api/movies/movieId
        api.put("movies", ":movieId", use: updateMovie)
        
    }
    
    
    func updateMovie(req: Request) async throws -> Movie {
        
        guard let movieId = req.parameters.get("movieId", as: UUID.self) else {
            throw Abort(.notFound)
        }
        
        guard let movie = try await Movie.find(movieId, on: req.db) else {
            throw Abort(.notFound, reason: "MovieId \(movieId) was not found.")
        }
        
        // decode the body
        let updateMovie = try req.content.decode(Movie.self)
        
        movie.title = updateMovie.title
        movie.year = updateMovie.year
        
        try await movie.update(on: req.db)
        return movie
        
    }
    
    func deleteMovie(req: Request) async throws -> Movie {
        
        guard let movieId = req.parameters.get("movieId", as: UUID.self) else {
            throw Abort(.notFound)
        }
        
        guard let movie = try await Movie.find(movieId, on: req.db) else {
            throw Abort(.notFound, reason: "MovieId \(movieId) was not found.")
        }
        
        try await movie.delete(on: req.db)
        return movie
        
    }
    
    func getById(req: Request) async throws -> Movie {
        
        guard let movieId = req.parameters.get("movieId", as: UUID.self) else {
            throw Abort(.notFound)
        }
        
        guard let movie = try await Movie.find(movieId, on: req.db) else {
            throw Abort(.notFound, reason: "MovieId \(movieId) was not found.")
        }
        
        return movie
        
    }
    
    func getAll(req: Request) async throws -> [Movie] {
        return try await Movie.query(on: req.db)
            .all()
    }
    
    
    func create(req: Request) async throws -> Movie {
        
        let movie = try req.content.decode(Movie.self)
        try await movie.save(on: req.db)
        return movie
        
    }
    
    
    
}
