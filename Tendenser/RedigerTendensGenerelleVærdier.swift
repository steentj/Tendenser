//
//  RedigerTendensGenerelleVærdier.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 17/08/2023.
//

import SwiftUI
import SwiftData

struct RedigerTendensGenerelleVærdier: View {
  var tendens: Tendens? = nil
  @State var navn = ""
  @State var maaleEnhed = ""
  @State var inkluderTidspunkt = false
  
  @Environment(\.modelContext) private var modelContext
  @Environment(\.dismiss) private var dismiss
  
  private var opretTendens: Bool {
    tendens == nil
  }
  
  var body: some View {
    VStack(spacing: 16) {
      Text(opretTendens ? "Ny Tendens" : "Opdater tendens")
        .font(.largeTitle.weight(.bold))
      
      HStack {
        LabeledContent {
          TextField("Krævet", text: $navn)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            .padding(10)
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
          TextField("Krævet", text: $maaleEnhed)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .textFieldStyle(.roundedBorder)
            .padding(10)
        } label: {
          Text("Måleenhed:")
            .frame(width: 140, height: 20, alignment: .leading)
            .foregroundColor(.black)
        }
        Spacer()
      }
      .foregroundColor(Color(rgb: 0x004643))
      
      Toggle(isOn: $inkluderTidspunkt,
             label: {
        Text("Inkluder tidspunkt:")
          .frame(width: 140, height: 20, alignment: .leading)
          .foregroundColor(.black)
      })
      .toggleStyle(.switch)
      
      Spacer()
      
      HStack(spacing: 50) {
        Button {
          dismiss()
        } label: {
          Text("Fortryd")
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
              .stroke(Color(rgb: 0x004643), lineWidth:2))
            .foregroundColor(Color(rgb: 0x004643))
        }
        
        Button {
          if opretTendens {
            let nyTendens = Tendens(0, navn, maaleEnhed, inkluderTidspunkt)
            modelContext.insert(nyTendens)
          } else {
            tendens?.navn = navn
            tendens?.maaleenhed = maaleEnhed
            tendens?.inkluderTidspunkt = inkluderTidspunkt
          }
      
          dismiss()
        } label: {
          HStack {
            Image(systemName: "square.and.arrow.down")
            Text("Gem")
          }
          .padding()
          .background(Color(rgb: 0x004643))
          .clipShape(.rect(cornerRadius: 10))
          .foregroundColor(.white)
        }
      }
      
      Spacer()
    }
    .padding()
    .task {
      if let tendens {
        navn = tendens.navn
        maaleEnhed = tendens.maaleenhed
        inkluderTidspunkt = tendens.inkluderTidspunkt
      }
    }
  }
}

#if DEBUG
#Preview("Ny") {
  return RedigerTendensGenerelleVærdier()
    .modelContainer(Tendens.preview)
}

#Preview("Opdater") {
  var fetchDescriptor = FetchDescriptor<Tendens>()
  fetchDescriptor.fetchLimit = 1
  
  let tendens = try! Tendens.preview.mainContext.fetch(fetchDescriptor).first!
  
  return RedigerTendensGenerelleVærdier(tendens: tendens)
    .modelContainer(Tendens.preview)
}
#endif
