//
//  TendenserApp.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI

@main
struct TendenserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(tendenser: Tendenser())
        }
    }
}
