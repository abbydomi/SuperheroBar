//
//  ViewFactory.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

struct ViewFactory {
    static func superhero() -> SuperheroView {
        .init(vm: ViewModelFactory.superhero())
    }
}
