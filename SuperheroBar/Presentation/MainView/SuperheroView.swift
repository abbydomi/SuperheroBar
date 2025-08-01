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
        ZStack {
            AsyncImage(url: vm.superhero?.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .opacity(0.2)
            } placeholder:  {
                if vm.superhero?.image != nil {
                    ProgressView()
                }
            }
            VStack {
                Text(vm.superhero?.name ?? "")
                    .font(.title)
                Text(vm.superhero?.biography ?? "")
                    .font(.body)
                Spacer()
                HStack {
                    Button("Fetch previous") {
                        vm.getCharacterName()
                    }
                    Button("Fetch next") {
                        vm.getCharacterName()
                    }
                }
            }
        }
        .onAppear(perform: vm.getCharacterName)
        .loading(when: $vm.isLoading)
        .padding()
    }
}

#Preview {
    SuperheroView(vm: .init(useCase: SuperheroUseCaseMock()))
}
