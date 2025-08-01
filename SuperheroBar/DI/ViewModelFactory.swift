//
//  ViewModelFactory.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

struct ViewModelFactory {
    static func superhero() -> SuperheroViewModel {
        .init(useCase: UseCaseFactory.superhero())
    }
}
