//
//  PreviewContainer.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 22/09/2023.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
  do {
    let container = try ModelContainer(
      for: Tendens.self,
      configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    let modelContext = container.mainContext
    
    if try modelContext.fetch(FetchDescriptor<Tendens>()).isEmpty {
      tendensTestdata.forEach { container.mainContext.insert($0) }
    }
    
    return container
    
  } catch {
    fatalError("Failed to create container")
  }
}()
