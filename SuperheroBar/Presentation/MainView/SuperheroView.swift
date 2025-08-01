//
//  ContentView.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import SwiftUI

struct SuperheroView: View {
    @StateObject private var vm: SuperheroViewModel

    init(vm: SuperheroViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        VStack {
            Image(systemName: "person.fill")
            Text(vm.name)
            Button("Fetch Harley") {
                vm.getCharacterName()
            }
        }
        .padding()
    }
}

#Preview {
    SuperheroView(vm: .init(useCase: SuperheroUseCaseMock()))
}
