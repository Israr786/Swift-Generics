//
//  ContentService.swift
//  GenericsDemo
//
//  Created by Israrul on 10/9/22.
//

import Foundation

struct ContentService {
    /// fetches data for the content of the
    ///
    /// - Parameter handler: called upon receiving the content
    func getItemData(handler: @escaping (Result<[Country], Error>) -> Void) {
        let url = URL(string: EndPoint.githubEndpoint)!
        URLSession.shared.dataTask(with: url) { data, response, rrror in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([Country].self, from: data)
                    handler(.success(decodedData))
            } catch {
                assertionFailure("Decoding failed")
                handler(.failure(error))
            }
        }.resume()
    }
}

