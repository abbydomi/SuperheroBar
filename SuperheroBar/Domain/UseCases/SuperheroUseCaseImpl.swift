//
//  SuperheroUseCaseImpl.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//


struct SuperheroUseCaseImpl: SuperheroUseCase {
    private let repository: SuperheroRepository

    init(repository: SuperheroRepository) {
        self.repository = repository
    }

    func getSuperhero() async throws -> Superhero {
        try await repository.getCharacter()
    }
}
