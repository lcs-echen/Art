//
//  ArtApp.swift
//  Art
//
//  Created by Evelyn Chen on 2023-04-20.
//

import SwiftUI

@main
struct ArtApp: App {
    @State var currentArt: ArtDataModel?
    var body: some Scene {
        WindowGroup {
            RandomView(currentArt: $currentArt)
        }
    }
}
