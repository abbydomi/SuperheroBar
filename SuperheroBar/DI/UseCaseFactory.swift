//
//  UseCaseFactory.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

struct UseCaseFactory {
    static func superhero() -> SuperheroUseCase {
        SuperheroUseCaseImpl(repository: RepositoryFactory.superhero())
    }
}
