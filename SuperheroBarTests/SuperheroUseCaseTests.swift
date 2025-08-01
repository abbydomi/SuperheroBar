//
//  SuperheroUseCaseTests.swift
//  SuperheroBarTests
//
//  Created by Abby Dominguez on 1/8/25.
//

import Testing
@testable import SuperheroBar
import Foundation

@Suite("SuperheroUseCase", .tags(.superhero, .useCase))
struct SuperheroUseCaseTests {
    private var repository = SuperheroRepositoryMock.mock

    private var sut: SuperheroUseCaseImpl {
        .init(repository: repository)
    }

    @Test("Get superhero information")
    func testGetSuperhero() async throws {
        let id = Int.random(in: 1...1000)

        let bio = "The long biography of Mockman from Mock City"
        let name = "Mockman"
        let image = URL(string: "https://placecats.com/300/500")
        repository._getCharacter = { _ in
            return .init(
                name: name,
                biography: bio,
                image: image
            )
        }
        let result = try await sut.getSuperhero(id: id)

        #expect(result.biography == bio)
        #expect(result.name == name)
        #expect(result.image == image)
    }
}
