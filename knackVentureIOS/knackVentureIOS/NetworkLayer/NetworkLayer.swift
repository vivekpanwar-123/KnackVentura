//
//  NetworkLayer.swift
//  knackVentureIOS
//
//  Created by 3991--CNM--GGN on 27/11/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let session: URLSession

     init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func fetchRepositories(session: URLSession = URLSession.shared, completion: @escaping (Result<[Repository], Error>) -> Void) {
        guard let url = URL(string: "https://api.github.com/orgs/square/repos") else {
            completion(.failure(NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }

            do {
                let repositories = try JSONDecoder().decode([Repository].self, from: data)
                completion(.success(repositories))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
