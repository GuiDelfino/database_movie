//
//  Database.swift
//  database_movie
//
//  Created by Guilherme Delfino on 19/08/24.
//

import UIKit

public struct MoviesResponse: Decodable {
    let results: [Movie]
}

public struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String
}

public enum MoviesResponseError: Error {
    case dataError
}





