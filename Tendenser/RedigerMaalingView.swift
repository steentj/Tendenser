//
//  RedigerMaalingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 22/08/2023.
//

import SwiftUI
import SwiftData

struct RedigerMaalingView: View {
  @Bindable var tendens: Tendens
  var item: Maaling? = nil
  
  @Environment(\.dismiss) var dismiss
  
  @State private var dato: Date = Date.now
  @State private var nyVaerdi: Decimal = 0.0
  @State private var nyVaerdiString: String = ""
  @State private var note: String = ""
  
  private var opretMaaling: Bool {
    item == nil
  }
  
  var body: some View {
    VStack {
      HStack {
        let components: DatePickerComponents = tendens.inkluderTidspunkt
          ? [.date, .hourAndMinute]
          : [.date]
        DatePicker("Dato:", selection: $dato, displayedComponents: components)
        
        Spacer()
      }
      
      HStack {
        Text("Måling: ")
        TextField("Målt vaerdi", text: $nyVaerdiString)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          .frame(width: 120)
          .textFieldStyle(.roundedBorder)
          .keyboardType(.decimalPad)
          .onChange(of: nyVaerdiString) { _, ny in
            if let temp = Double(ny) {
              nyVaerdi = Decimal(temp)
            } else {
              
            }
          }
        
        Spacer()
      }
      
      Text("Note:")
      TextEditor(text: $note)
        .padding(4)
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(.black, lineWidth: 1)
        )
      
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
          if opretMaaling {
            let nyMaaling = Maaling(tid: dato, vaerdi: nyVaerdi, note: note)
            tendens.maalinger.append(nyMaaling)
          } else {
            item?.tid = dato
            item?.vaerdi = nyVaerdi
            item?.note = note
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
    .padding(30)
    .task {
      if item != nil {
        dato = item!.tid
        nyVaerdi = item!.vaerdi ?? 0
        nyVaerdiString = "\(item!.vaerdi ?? 0)"
        note = item!.note
      }
    }
  }
}

func lavNumberFormatter() -> NumberFormatter {
  let fmt = NumberFormatter()
  fmt.maximumFractionDigits = 8
  fmt.allowsFloats = true
  return fmt
}


#Preview {
  let fetchDescriptor = FetchDescriptor<Tendens>(sortBy: [SortDescriptor(\Tendens.prioritet)])
  
  let tendens = try! Tendens.preview.mainContext.fetch(fetchDescriptor).first!
  
//  return RedigerMaalingView(tendens: tendens)
  return RedigerMaalingView(tendens: tendens, item: tendens.maalinger.first!)
}
