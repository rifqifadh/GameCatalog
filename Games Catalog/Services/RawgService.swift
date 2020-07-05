//
//  GamesProtocol.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

class RawgService {
    public enum Endpoint {
        case games
        case detail(id: Int)
        case screenshots(id: Int)
        
        public func path() -> String {
            switch self {
                case .games:
                    return "games"
                case let .detail(id):
                    return "games/\(id)"
                case let .screenshots(id):
                    return "games/\(id)/screenshots"
            }
        }
    }
    
    static private let decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    static private func makeUrl(endpoint: Endpoint, params: [String: String]? = nil) -> URL {
        var component = URLComponents(url: Constants.baseUrl.appendingPathComponent(endpoint.path()), resolvingAgainstBaseURL: false)!
        var queryItems = [URLQueryItem(name: "", value: "")]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        component.queryItems = queryItems
        return component.url!
    }
    
    static func fetch<T: Codable>(from endpoint: Endpoint, params: [String: String]? = nil, response: T.Type,  completion: @escaping (T?) -> Void) {
        
        let request = URLRequest(url: makeUrl(endpoint: endpoint, params: params))
        
        let userInitiated = DispatchQueue.global(qos: .userInitiated)
        userInitiated.async {
            return URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }
                
                let games = try? self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(games)
                }
            }
            .resume()
        }
    }
}
