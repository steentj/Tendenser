//
//  TendenserApp.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI
import SwiftData

@main
struct TendenserApp: App {
  var modelContainer: ModelContainer
  
  init() {
    do {
      self.modelContainer = try ModelContainer(for: Tendens.self, Maaling.self, migrationPlan: nil)
    }
    catch {
      fatalError("Kunne ikke initialisere model containeren!")
    }
  }

  var body: some Scene {
      WindowGroup {
        ContentView()
      }
      .modelContainer(modelContainer)
  }
}
