//
//  SuperheroLoginLauncherApp.swift
//  SuperheroLoginLauncher
//
//  Created by Abby Dominguez on 1/8/25.
//

import SwiftUI

@main
struct SuperheroLoginLauncherApp: App {
    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
        .commands {
            CommandGroup(replacing: .newItem) { }
        }
    }

    init() {
        launchMainApp()
        NSApp.terminate(nil)
    }

    func launchMainApp() {
        let mainAppBundleId = "com.abbydomi.SuperheroBar"
        if !NSWorkspace.shared.launchApplication(withBundleIdentifier: mainAppBundleId,
                                                         options: [.default],
                                                         additionalEventParamDescriptor: nil,
                                              launchIdentifier: nil) {
            print("Failed to launch the main app!")
        }
    }
}
