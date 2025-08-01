//
//  SuperheroParser.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Foundation

struct SuperheroParser {
    static func parse(from response: SuperheroResponse) -> Superhero {
        .init(name: response.name ?? "No name",
              biography: parseBio(from: response.biography),
              image: URL(string: response.image?.url ?? "")
        )
    }

    static func parseBio(from bio: Biography?) -> String {
        guard let bio else { return "No biography."}
        let fullName = "Full name: " + (bio.fullName ?? "No full name.")
        let alisases = "Aliases: " + (bio.aliases?.joined(separator: ", ") ?? "No aliases.")
        let placeOfBirth = "Place of birth: " + (bio.placeOfBirth ?? "No place of birth recorded.")
        let firstAppearance = "First appearance: " + (bio.firstAppearance ?? "No fist appearance recorded.")
        let publisher = "Published by: " + (bio.publisher ?? "Unknown.")
        let alignment = "Alignment: " + (bio.alignment?.uppercased() ?? "Unknown.")

        return fullName + "\n"
        + alisases + "\n"
        + placeOfBirth + "\n"
        + firstAppearance + "\n"
        + publisher + "\n"
        + alignment
    }
}
