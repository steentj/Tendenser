//
//  TendensEditor.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 14/08/2023.
//

import SwiftUI
import SwiftData

struct TendensView: View {
  @Bindable var tendens: Tendens
  
  var body: some View {
    VStack {
      TendensMaalingerView(tendens: tendens)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text(tendens.navn)
          .foregroundColor(.white)
          .fontWeight(.bold)
      }
      
      ToolbarItem {
        NavigationLink(destination: RedigerMaalingView(tendens: tendens)) {
          Text(Image(systemName: "plus.circle"))
        }
      }
    }
    .toolbarBackground(Color("mørkegrøn"))
    .toolbarBackground(.visible, for: .automatic)
  }
}

#if DEBUG
#Preview {
  var fetchDescriptor = FetchDescriptor<Tendens>()
  fetchDescriptor.fetchLimit = 1

  let tendens = try! Tendens.preview.mainContext.fetch(fetchDescriptor).first!

  return TendensView(tendens: tendens)
    .modelContainer(Tendens.preview)
}
#endif
