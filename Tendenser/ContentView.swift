//
//  ContentView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Query(sort: \Tendens.prioritet) private var tendenser: [Tendens]
  @State private var sti = [Tendens]()
  
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    
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
      .navigationTitle(Text("Tendenser"))
//      .navigationDestination(for: Tendens.self, destination: TendensView.init)
      .scrollContentBackground(.hidden)
      .background(Color(rgb: 0xabd1c6))
      .navigationBarTitleDisplayMode(.automatic)
      .listStyle(InsetListStyle())
      .toolbar {
        Button("Tilføj tendens", systemImage: "plus", action:tilføjTendens)
          .toolbarColorScheme(.dark, for: .navigationBar)
          .toolbarBackground(LinearGradient(colors: [Color(rgb: 0x004643), Color(rgb: 0x005643)],
                                            startPoint: .leading, endPoint: .trailing), for: .navigationBar)
          .toolbarBackground(.visible, for: .navigationBar)
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
    sti = [tendens]
  }
}

struct HovedTitel: View {
  var body: some View {
    HStack(alignment: .top) {
      Spacer()
      Text(Image(systemName: "chart.line.uptrend.xyaxis")).font(.title2)
      Text("Tendenser").font(.title2)
      Spacer()
      Button("+", action: {
        // gør noget
      })
        .padding(.trailing)
        .font(.title2).fontWeight(.bold)
    }
    .frame(height: 32.0)
    .background(Color(rgb: 0x004643))
    .foregroundColor(Color(rgb: 0xfffffe))
    .cornerRadius(10)
  }
}

#Preview {
    ContentView()
      .frame(minWidth: 500, minHeight: 500)
      .modelContainer(previewContainer)
}
