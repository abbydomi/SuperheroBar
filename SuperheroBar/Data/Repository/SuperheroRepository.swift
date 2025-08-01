//
//  SuperheroRepository.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Foundation

struct SuperheroRepository {
    private let network: SuperheroDatasource

    init(network: SuperheroDatasource) {
        self.network = network
    }

    func getCharacter(id: Int) async throws -> Superhero {
        let response = try await network.fetchCharacter(id: id)
        print(response)
        if response.response == "error" {
            throw APIError.init(error: "Error", message: "Unknown error", statusCode: .badRequest)
        }
        return SuperheroParser.parse(from: response)
    }
}
