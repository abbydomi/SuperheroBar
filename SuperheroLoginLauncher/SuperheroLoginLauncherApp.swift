//
//  SuperheroLoginLauncherApp.swift
//  SuperheroLoginLauncher
//
//  Created by Abby Dominguez on 1/8/25.
//

import SwiftUI

@main
struct SuperheroLoginLauncherApp: App {

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    launchMainApp()
                }
        }
        .commands {
            CommandGroup(replacing: .newItem) { }
        }
    }

    func launchMainApp() {
        let mainAppBundleId = "com.abbydomi.SuperheroBar"
        if !NSWorkspace.shared.launchApplication(withBundleIdentifier: mainAppBundleId,
                                                 options: [.default],
                                                 additionalEventParamDescriptor: nil,
                                                 launchIdentifier: nil) {
            print("Failed to launch the main app!")
        } else {
            // Terminate after launching the main app, with a slight delay to avoid killing too early
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                NSApp.terminate(nil)
            }
        }
    }
}
