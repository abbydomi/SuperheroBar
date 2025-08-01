//
//  MainViewModel.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Combine
import Foundation

class SuperheroViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var image: URL?
    @Published var superhero: Superhero?
    let useCase: SuperheroUseCase

    init(useCase: SuperheroUseCase) {
        self.useCase = useCase
    }

    func getCharacterName() {
        Task {
            do {
                let superhero = try await useCase.getSuperhero()
                updateCharacter(with: superhero)
            } catch {
                // TODO: Handle error
                print(error)
            }
        }
    }

    func updateCharacter(with model: Superhero) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            name = model.name
            image = model.image
            superhero = model
        }
    }
}
