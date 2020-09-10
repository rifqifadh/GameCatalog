//
//  RawgService.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

public enum NetworkError: Error {
	case badURL, requestFailed, unknown
}

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
		jsonDecoder.dateDecodingStrategy = .iso8601
		return jsonDecoder
	}()
	
	static private func makeUrl(endpoint: Endpoint, params: [String: String]? = nil) -> URL {
		var component = URLComponents(url: Constants.baseUrl.appendingPathComponent(endpoint.path()), resolvingAgainstBaseURL: false)!
		if let params = params {
			let queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value )}
			component.queryItems = queryItems
		}
		return component.url!
	}
	
	static func fetch<T: Codable>(from endpoint: Endpoint, params: [String: String]? = nil,
											  response: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
		
		let request = URLRequest(url: makeUrl(endpoint: endpoint, params: params))
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			if let data = data {
				if let decoded = try? self.decoder.decode(T.self, from: data){
					completion(.success(decoded))					
				}
			} else if error != nil {
				completion(.failure(.requestFailed))
			} else  {
				completion(.failure(.unknown))
			}
		}.resume()
	}
}
