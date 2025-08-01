//
//  SuperheroRepository.swift
//  apptest
//
//  Created by Abby Dominguez on 1/8/25.
//

struct SuperheroRepository {
    private let network: SuperheroDatasource

    init(network: SuperheroDatasource) {
        self.network = network
    }

    func getCharacter() async throws -> Superhero {
        let response = try await network.fetchCharacter(id: 307)
        print(response)
        return .init(name: response.name ?? "")
    }
}
