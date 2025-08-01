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
    private var currentId = Endpoint.HarleyQuinn
    let useCase: SuperheroUseCase

    enum Direction {
        case next
        case previous
        case none
    }

    init(useCase: SuperheroUseCase) {
        self.useCase = useCase
    }

    func getCharacter(dir: Direction = .none) {
        setLoading(to: true)
        switch dir {
        case .next: currentId += 1
        case .none: break
        case .previous: currentId -= 1
        }
        Task {
            do {
                let superhero = try await useCase.getSuperhero(id: currentId)
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
