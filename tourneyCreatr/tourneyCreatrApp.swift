//
//  tourneyCreatrApp.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import SwiftUI

@main
struct tourneyCreatrApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PlayerViewModel())
        }
    }
}
