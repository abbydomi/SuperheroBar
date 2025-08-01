//
//  SuperheroRepository.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Foundation

protocol SuperheroRepository {
    func getCharacter(id: Int) async throws -> Superhero
}
