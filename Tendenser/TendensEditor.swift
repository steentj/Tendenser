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
      TendensView(tendens: $tendensKopi, isEditing: erNy ? true: isEditing)
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
                  print("Færdig, gemmer ændringer til \(tendens.navn).")
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
  }
}

struct TendensEditor_Previews: PreviewProvider {
    static var previews: some View {
      TendensEditor(tendens: .constant(Tendens()), erNy: true)
    }
}
