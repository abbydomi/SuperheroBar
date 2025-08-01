//
//  MainViewModel.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Combine
import Foundation

class SuperheroViewModel: ObservableObject {
    @Published var superhero: Superhero?
    @Published var isLoading = false
    let useCase: SuperheroUseCase

    init(useCase: SuperheroUseCase) {
        self.useCase = useCase
    }

    func getCharacterName() {
        Task {
            setLoading(to: true)
            do {
                let superhero = try await useCase.getSuperhero()
                updateCharacter(with: superhero)
            } catch {
                // TODO: Handle error
                print(error)
            }
            setLoading(to: false)
        }
    }
}
// MARK: Private methods
private extension SuperheroViewModel {
    func updateCharacter(with model: Superhero) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            superhero = model
        }
    }

    func setLoading(to state: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            isLoading = state
        }
    }
}
