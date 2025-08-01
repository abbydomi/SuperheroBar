//
//  SuperheroUseCaseMock.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Foundation

struct SuperheroUseCaseMock: SuperheroUseCase {
    func getSuperhero(id: Int) async throws -> Superhero {
        .init(
            name: "Mockman",
            biography: "The superhero from mock city",
            image: URL(string: "https://placecats.com/300/200")
        )
    }
}
