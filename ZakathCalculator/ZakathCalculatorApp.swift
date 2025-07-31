//
//  ZakathCalculatorApp.swift
//  ZakathCalculator
//
//  Created by Shaheem on 2025-07-30.
//

import SwiftUI
import SwiftData

@main
struct ZakathCalculatorApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, ZakatRecord.self])
    }
}
