//
//  GamesProtocol.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

protocol GamesServices {
    func fetchGames(enpoint: Endpoint, params: [String: String]?, completinon: @escaping (_ response: GamesResponse) -> Void) -> Void
}

public enum Endpoint: String {
    case games
}
