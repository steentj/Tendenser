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
  @Binding var redigering: Bool
//  @Environment(\.dismiss) var dismiss
  @State var nyMaaling: Bool = false
  
  var body: some View {
    VStack {
      if redigering {
        RedigerTendensGenerelleVærdier(tendens: tendens)
      }
      
      TendensMaalingerView(tendens: tendens)
        .toolbar {
          ToolbarItem(placement: .principal) {
            Text(tendens.navn)
              .foregroundColor(.white)
              .fontWeight(.bold)
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              redigering.toggle()
            } label: {
              Text(redigering ? Image(systemName: "checkmark") : Image(systemName: "pencil"))
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              nyMaaling.toggle()
            } label: {
              Label("Tilføj måling", systemImage: "plus")
            }
          }
        }
        .toolbarBackground(LinearGradient(
          colors: [Color(rgb: 0x004643), Color(rgb: 0x005643)],
          startPoint: .leading, endPoint: .trailing),
         for: .navigationBar)
        .toolbarBackground(.visible, for: .automatic)
    }
    .sheet(isPresented: $nyMaaling, content: {
      RedigerMaalingView(tendens: tendens, item: Maaling(), nyMaaling: true)
    })
    .onDisappear(perform: {
      redigering = false
    })
  }
}

//struct SwiftDataPreviewWrapper<Content: View>: View {
//  @ViewBuilder var view: Content
//  
//  let modelContainer: ModelContainer
//  
//  init<S>(of type: S.Type, view: () -> Content) where S : PersistentModel {
//    do {
//      modelContainer = try ModelContainer(for: type, configurations: .init(isStoredInMemoryOnly: true))
//      
//    } catch {
//      fatalError("Could not initialize ModelContainer")
//    }
//    self.view = view()
//  }
//  var body: some View {
//    view
//      .modelContainer(modelContainer)
//    
//  }
//}

//#Preview {
//  let config = ModelConfiguration(isStoredInMemoryOnly: true)
//  let container = try! ModelContainer(for: Tendens.self, configurations: config)
//  
//  let testEksempel = Tendens(1,
//                            "Blodsukker",
//                            "mmol",
//                            false,
//                            [Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 42, note: ""),
//                             Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   vaerdi: 45, note: "Dette er en note.\nDen er på 2 linjer."),
//                             Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   vaerdi: 51, note: "")])
//  
//  return TendensView(tendens: testEksempel, redigering: .constant(false))
//    .modelContainer(container)
//}
