//
//  BigBangAppApp.swift
//  BigBangApp
//
//  Created by Rubén Segura Romo on 21/11/24.
//

import SwiftUI

@main
struct BigBangAppApp: App {
    
    @StateObject private var bigbangVM = BigBangViewModel()
    
    var body: some Scene {
        WindowGroup {
            EntryView()
        }
        .environmentObject(bigbangVM)
    }
}
