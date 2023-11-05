//
//  RedigerMaalingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 22/08/2023.
//

import SwiftUI

struct RedigerMaaling: View {
  @Binding var item: Maaling
  @State var visNote = false
  var inkluderTid: Bool
  
  var body: some View {
    HStack {
      DatePicker("", selection: $item.tid, displayedComponents: .date)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      
      if inkluderTid {
        DatePicker("", selection: $item.tid, displayedComponents: .hourAndMinute)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      }
      
      TextField("Målt vaerdi", value: $item.vaerdi, formatter: lavNumberFormatter())
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .frame(width: 100)
        .textFieldStyle(.roundedBorder)
      Button("Note") {
        visNote = true
      }
      .sheet(isPresented: $visNote) {
        TextEditor(text: $item.note)
          .autocorrectionDisabled(true)
      }
      .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
      .foregroundColor(.black)
      .buttonStyle(.bordered)
      .buttonBorderShape(.roundedRectangle)
    }
    .font(.body)
  }
}

func lavNumberFormatter() -> NumberFormatter {
  let fmt = NumberFormatter()
  fmt.maximumFractionDigits = 8
  fmt.allowsFloats = true
  return fmt
}


struct RedigerMaaling_Previews: PreviewProvider {
    static var previews: some View {
      RedigerMaaling(item: Binding<Maaling>.constant(
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!, vaerdi: 42.3512345678, note: "")), inkluderTid: true)
    }
}
