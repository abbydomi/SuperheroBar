//
//  SuperheroRepositoryMock.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

@testable import SuperheroBar
import Foundation

class SuperheroRepositoryMock: SuperheroRepository {
    var _getCharacter: (Int) -> Superhero

    init(_getCharacter: @escaping (Int) -> Superhero) {
        self._getCharacter = _getCharacter
    }

    func getCharacter(id: Int) async throws -> SuperheroBar.Superhero {
        _getCharacter(id)
    }
}

extension SuperheroRepositoryMock {
    static var mock: SuperheroRepositoryMock {
        .init { _ in
                .init(
                    name: "Mockman",
                    biography: "The long biography of Mockman from Mock City",
                    image: .init(string: "https://placecats.com/300/500")
                )
        }
    }
}
