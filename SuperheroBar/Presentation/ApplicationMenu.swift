//
//  ApplicationMenu.swift
//  SuperheroBar
//
//  Created by Abby Dominguez on 1/8/25.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()

    func createMenu() -> NSMenu {
        let view = ViewFactory.superhero()
        let hostingController = NSHostingController(rootView: view)
        hostingController.view.frame.size = CGSize(width: 300, height: 500)
        let menuItem = NSMenuItem()
        menuItem.view = hostingController.view

        menu.addItem(menuItem)
        menu.addItem(.separator())

        return menu
    }
}
