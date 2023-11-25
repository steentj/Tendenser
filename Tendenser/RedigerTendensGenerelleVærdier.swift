//
//  RedigerTendensGenerelleVærdier.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 17/08/2023.
//

import SwiftUI

struct RedigerTendensGenerelleVærdier: View {
  @Bindable var tendens: Tendens
  
  var body: some View {
    Form {
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
        TextField("Krævet", text: $tendens.maaleenhed)
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
