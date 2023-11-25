//
//  ContentView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI
import SwiftData

struct TendensListeView: View {
  @Query(sort: \Tendens.prioritet) private var tendenser: [Tendens]
  @State private var sti = [Tendens]()
  @State private var nyTendens = false
  
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    
    ZStack {
      Color(Color(rgb: 0x004643)).ignoresSafeArea()
      
      VStack {
        TitelView(tilføjTendens: tilføjTendens, sti: sti)
        
        NavigationStack(path: $sti) {
          List {
            ForEach(tendenser) { tendens in
              NavigationLink(value: tendens) {
                Text(tendens.navn)
              }
              .background(Color(rgb: 0xabd1c6))
              .foregroundColor(Color(rgb: 0x0f3433))
              .listRowBackground(Color(rgb: 0xabd1c6))
            .listRowSeparator(Visibility.automatic)
            }
            .onDelete(perform: sletTendenser)
          }
          .navigationDestination(for: Tendens.self, destination: { tendens in
            TendensView(tendens: tendens, redigering: $nyTendens)
          })
          .scrollContentBackground(.hidden)
          .background(Color(rgb: 0xabd1c6))
          .listStyle(InsetListStyle())
        }
      }
    }
  }
  
  func sletTendenser(_ indexSet: IndexSet) {
    for index in indexSet {
      let tendens = tendenser[index]
      modelContext.delete(tendens)
    }
  }
  
  func tilføjTendens() {
    let tendens = Tendens()
    modelContext.insert(tendens)
    nyTendens.toggle()
    sti = [tendens]
  }
}

#Preview {
    TendensListeView()
      .modelContainer(previewContainer)
}
