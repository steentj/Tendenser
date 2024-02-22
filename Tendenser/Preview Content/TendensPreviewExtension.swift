//
//  TendensPreviewExtension.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 13/02/2024.
//

import Foundation
import SwiftData

extension Tendens {
  
  @MainActor
  static var preview: ModelContainer {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
      for: Tendens.self,
      configurations: config)
    
    let modelContext = container.mainContext
    
    if try! modelContext.fetch(FetchDescriptor<Tendens>()).isEmpty {
      tendensTestdata.sorted(by: >).forEach { container.mainContext.insert($0) }
    }
    
    return container
  }
}
