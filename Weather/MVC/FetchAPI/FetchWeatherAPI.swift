//
//  FetchAPI.swift
//  Weather
//
//  Created by Antonio Flores on 6/12/21.
//

import Foundation

struct ProjectAPIClient {

    // MARK: - Static Properties

    static let manager = ProjectAPIClient()

    // MARK: - Internal Methods

    func getProjects(completionHandler: @escaping (Result<Weather, AppError>) -> Void) {
        
        NetworkHelper.manager.performDataTask(withUrl: weatherURL, andHTTPBody: nil, andMethod: .get) { (result) in
            switch result {
            case let .failure(error):
                completionHandler(.failure(error))
                return
            case let .success(data):
                do {
                    let projects = try JSONDecoder().decode(Weather.self, from: data)
                    completionHandler(.success(projects))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }

    }

    // MARK: - Private Properties and Initializers

    private var weatherURL: URL {
        guard let url = URL(string: "https://api.darksky.net/forecast/\(Secrets.DarkSkysKey)/42.3601,-71.0589") else {
            fatalError("Error: Invalid URL")
        }
        return url
    }

    private init() {}
}
