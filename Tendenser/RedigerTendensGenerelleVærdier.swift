//
//  RedigerTendensGenerelleVærdier.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 17/08/2023.
//

import SwiftUI

struct RedigerTendensGenerelleVærdier: View {
  @Binding var tendens: Tendens
  
  var body: some View {
    HStack {
      LabeledContent {
        TextField("Krævet", text: $tendens.navn)
          .autocorrectionDisabled()
          .textInputAutocapitalization(.never)
          .textFieldStyle(.roundedBorder)
          .padding(10)
          .onSubmit {
            //
          }
      } label: {
        Text("Navn på måling:").foregroundColor(Color(rgb: 0xfffffe))
      }
      Spacer()
    }
    .foregroundColor(Color(rgb: 0x004643))
    
    HStack {
      LabeledContent {
        TextField("Krævet", text: $tendens.måleenhed)
          .autocorrectionDisabled()
          .textInputAutocapitalization(.never)
          .textFieldStyle(.roundedBorder)
          .padding(10)
          .onSubmit {
            //
          }
      } label: {
        Text("Måleenhed:").foregroundColor(Color(rgb: 0xfffffe))
      }
      Spacer()
    }
    .foregroundColor(Color(rgb: 0x004643))
 
    Toggle(isOn: $tendens.inkluderTidspunkt, label: {Text("Inkluder tidspunkt:")})
      .toggleStyle(.switch)
      .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 10))
  }
}

struct RedigerTendensGenerelleVærdier_Previews: PreviewProvider {
    static var previews: some View {
      RedigerTendensGenerelleVærdier(tendens: Binding<Tendens>.constant(
        Tendens(1,
                "Blodsukker",
                "mmol",
                true,
                [Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   værdi: 42, note: ""),
                 Måling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   værdi: 45, note: ""),
                 Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: "")])))
    }
}
