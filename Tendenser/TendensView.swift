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
//  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    Form {
      TendensMaalingerView(tendens: tendens)
      //        .toolbar {
      //          ToolbarItem(placement: .cancellationAction) {
      //            if erNy {
      //              Button("Fortryd") {
      //                dismiss()
      //              }
      //            }
      //          }
      //          ToolbarItem {
      //            Button {
      //              if erNy {
      //                tendenser.add(tendensKopi)
      //                dismiss()
      //              } else {
      //                if isEditing {
      //                  withAnimation {
      //                    tendens = tendensKopi
      //                  }
      //                }
      //                isEditing.toggle()
      //              }
      //            } label: {
      //              Text(erNy ? "Tilføj" : (isEditing ? "Færdig" : "Rediger"))
      //            }
      //          }
      //        }
      //        .onAppear {
      //          tendensKopi = tendens
      //        }
      //    .toolbarColorScheme(.dark, for: .navigationBar)
      //    .toolbarBackground(LinearGradient(colors: [Color(rgb: 0x004643), Color(rgb: 0x005643)],
      //                                      startPoint: .leading, endPoint: .trailing), for: .navigationBar)
      //    .toolbarBackground(.visible, for: .automatic)
        .navigationTitle(tendens.navn)
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Tendens.self, configurations: config)
    let testEksempel = Tendens(1,
                              "Blodsukker",
                              "mmol",
                              false,
                              [Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 42, note: ""),
                               Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   vaerdi: 45, note: "Dette er en note.\nDen er på 2 linjer."),
                               Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   vaerdi: 51, note: "")])
    return TendensView(tendens: testEksempel).modelContainer(container)
    
  }
  catch {
    fatalError("Fatal fejl i opsætning af test container til TendensView preview.")
  }
}

//struct TendensView_Previews: PreviewProvider {
//    static var previews: some View {
//      TendensView(tendens: Binding<Tendens>.constant(
//        Tendens(1,
//                "Blodsukker",
//                "mmol",
//                false,
//                [Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 42, note: ""),
//                 Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   vaerdi: 45, note: "Dette er en note.\nDen er på 2 linjer."),
//                 Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   vaerdi: 51, note: "")])), erNy: false)
//    }
//}


