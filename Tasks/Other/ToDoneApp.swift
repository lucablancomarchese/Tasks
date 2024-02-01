//
//  ToDoneApp.swift
//  ToDone
//
//  Created by Luca Blanco Marchese on 04.01.24.
//

import SwiftUI
import FirebaseCore
@main
struct ToDoneApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
