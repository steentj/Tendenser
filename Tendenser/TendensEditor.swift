//
//  TendensEditor.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 14/08/2023.
//

import SwiftUI

struct TendensEditor: View {
  @Binding var tendens: Tendens
  let erNy: Bool
  
  @EnvironmentObject var tendenser: Tendenser
  @Environment(\.dismiss) private var dismiss
  
  @State private var tendensKopi = Tendens()
  @State private var isEditing = false
  
  var body: some View {
    VStack {
      TendensView(tendens: $tendensKopi, isEditing: erNy ? true : isEditing)
        .toolbar {
          ToolbarItem(placement: .cancellationAction) {
            if erNy {
              Button("Fortryd") {
                dismiss()
              }
            }
          }
          ToolbarItem {
            Button {
              if erNy {
                tendenser.TendensListe.append(tendensKopi)
                dismiss()
              } else {
                if isEditing {
                  withAnimation {
                    tendens = tendensKopi
                  }
                }
                isEditing.toggle()
              }
            } label: {
              Text(erNy ? "Tilføj" : (isEditing ? "Færdig" : "Rediger"))
            }
          }
        }
        .onAppear {
          tendensKopi = tendens
        }
    }
    .toolbarColorScheme(.dark, for: .navigationBar)
    .toolbarBackground(LinearGradient(colors: [Color(rgb: 0x004643), Color(rgb: 0x005643)],
                                      startPoint: .leading, endPoint: .trailing), for: .navigationBar)
    .toolbarBackground(.visible, for: .automatic)
    .navigationTitle(tendensKopi.navn)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct TendensEditor_Previews: PreviewProvider {
    static var previews: some View {
      TendensEditor(tendens: Binding<Tendens>.constant(
        Tendens(1,
                "Blodsukker",
                "mmol",
                false,
                [Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   værdi: 42, note: ""),
                 Måling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   værdi: 45, note: "Dette er en note.\nDen er på 2 linjer."),
                 Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: "")])), erNy: false)
    }
}


