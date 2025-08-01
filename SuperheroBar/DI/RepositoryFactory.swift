//
//  RepositoryFactory.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

struct RepositoryFactory {
    static func superhero() -> SuperheroRepository {
        .init(network: DatasourceFactory.superhero())
    }
}
