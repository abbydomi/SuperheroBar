//
//  ErrorModifier.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import SwiftUI

private struct ErrorModifier: ViewModifier {
    @Binding private var isError: Bool
    private var message: String
    private var action: () -> Void

    init(isError: Binding<Bool>, message: String? = nil, action: @escaping () -> Void) {
        self._isError = isError
        self.action = action

        if let message {
            self.message = message
        } else {
            self.message = "Unknown error ocurred."
        }
    }

    func body(content: Content) -> some View {
        ZStack {
            if !isError {
                content
            }
            if isError {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                    Text(message)
                        .font(.callout)
                    Button("Retry") {
                        action()
                    }
                }
            }
        }
    }
}

extension View {
    func error(when isError: Binding<Bool>, message: String? = nil, action: @escaping () -> Void) -> some View {
        modifier(ErrorModifier(isError: isError, message: message, action: action))
    }
}
