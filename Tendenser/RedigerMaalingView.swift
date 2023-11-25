//
//  RedigerMaalingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 22/08/2023.
//

import SwiftUI

struct RedigerMaalingView: View {
  @Bindable var tendens: Tendens
  @Bindable var item: Maaling
  var nyMaaling: Bool = false
  
  init(tendens: Tendens, item: Maaling, nyMaaling: Bool) {
    self.tendens = tendens
    self.item = item
    if nyMaaling {
      self.tendens.maalinger.append(item)
    }
  }
  
  var body: some View {
    Form {
      VStack {
        HStack {
          let components: DatePickerComponents = tendens.inkluderTidspunkt
          ? [.date]
          : [.date, .hourAndMinute]
          DatePicker("Dato:", selection: $item.tid, displayedComponents: components)
               
          Spacer()
        }
        
        HStack {
          Text("Måling: ")
          TextField("Målt vaerdi", value: $item.vaerdi, formatter: lavNumberFormatter())
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .frame(width: 120)
            .textFieldStyle(.roundedBorder)
            Spacer()
        }
        
        Text("Note:")
        TextEditor(text: $item.note)
          .padding(4)
          .overlay(
            RoundedRectangle(cornerRadius: 14)
              .stroke(.black, lineWidth: 1)
          )
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


//#Preview {
//  Group {
//    @State var maaling = Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15, hour: 12, minute: 45))!, vaerdi: 42.3512345678, note: "")
//    RedigerMaaling(item: $maaling, inkluderTid: false)
//  }
//}
