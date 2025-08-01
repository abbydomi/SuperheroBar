//
//  RepositoryFactory.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

struct RepositoryFactory {
    static func superhero() -> SuperheroRepository {
        SuperheroRepositoryImpl(network: DatasourceFactory.superhero())
    }
}
