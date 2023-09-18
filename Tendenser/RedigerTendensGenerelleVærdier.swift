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
    VStack {
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
          Text("Navn på måling:")
            .frame(width: 140, height: 20, alignment: .leading)
            .foregroundColor(.black)
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
        Text("Måleenhed:")
          .frame(width: 140, height: 20, alignment: .leading)
          .foregroundColor(.black)
      }
      Spacer()
    }
    .foregroundColor(Color(rgb: 0x004643))
 
    Toggle(isOn: $tendens.inkluderTidspunkt,
           label: {
              Text("Inkluder tidspunkt:")
                .frame(width: 140, height: 20, alignment: .leading)
                .foregroundColor(.black)
            })
      .toggleStyle(.switch)
    }
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20 ))
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
