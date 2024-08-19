//
//  ViewController.swift
//  database_movie
//
//  Created by Guilherme Delfino on 19/08/24.
//

import UIKit

class DatabaseViewController: UIViewController {
    
    let apiKey = "fee68b4c403fd1984f58b90c995bc68a"

    func getMoviesFromAPI() async throws -> [Movie] {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(MoviesResponse.self, from: data)
        
        return decoded.results
        
        
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        Task {
            do{
                let movies = try await getMoviesFromAPI()
                print(movies)
            } catch {
                print(error)
            }
        }
        
    }


}

