//
//  SuperheroUseCase.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

protocol SuperheroUseCase {
    func getSuperhero() async throws -> Superhero
}
