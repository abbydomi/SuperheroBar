//
//  LoadingModifier.swift
//  SuperheroBar
//
//  Created by Abigail Domínguez on 1/8/25.
//

import SwiftUI

private struct LoadingModifier: ViewModifier {
    @Binding private var isLoading: Bool
    private var message: LocalizedStringKey

    init(isLoading: Binding<Bool>, message: LocalizedStringKey? = nil) {
        self._isLoading = isLoading

        if let message {
            self.message = message
        } else {
            self.message = "Loading..."
        }
    }
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                VStack {
                    ProgressView()
                    Text(message)
                        .font(.callout)
                }
            }
        }
    }
}

extension View {
    func loading(when isLoading: Binding<Bool>, message: LocalizedStringKey? = nil) -> some View {
        modifier(LoadingModifier(isLoading: isLoading, message: message))
    }
}
