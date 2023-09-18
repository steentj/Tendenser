//
//  RedigerMålingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 22/08/2023.
//

import SwiftUI

struct RedigerMåling: View {
  @Binding var item: Måling
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
      
      TextField("Målt værdi", value: $item.værdi, formatter: lavNumberFormatter())
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .frame(width: 100)
        .textFieldStyle(.roundedBorder)
      Button("Note") {
        visNote = true
      }
      .sheet(isPresented: $visNote) {
        TextEditor(text: $item.note)
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


struct RedigerMåling_Previews: PreviewProvider {
    static var previews: some View {
      RedigerMåling(item: Binding<Måling>.constant(
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!, værdi: 42.3512345678, note: "")), inkluderTid: true)
    }
}
