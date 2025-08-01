//
//  DatasourceFactory.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

struct DatasourceFactory {
    static let apiClient = APIClient(apiKey: Env.apikey) // APIKEY goes here (Obv the Env file isn't in the repo)!!

    static func superhero() -> SuperheroDatasource {
        .init(apiClient: apiClient)
    }
}
