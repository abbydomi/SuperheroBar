//
//  MainViewModel.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Combine

class SuperheroViewModel: ObservableObject {
    @Published var name: String = ""
    let useCase: SuperheroUseCase

    init(useCase: SuperheroUseCase) {
        self.useCase = useCase
    }

    func getCharacterName() {
        Task {
            do {
                name = try await useCase.getSuperhero().name
            } catch {
                // TODO: Handle error
                print(error)
            }
        }
    }
}
