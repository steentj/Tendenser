//
//  MålingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 24/08/2023.
//

import SwiftUI

struct MålingView: View {
  @Binding var måling: Måling
  var måleenhed: String
  var dateFormatStyle: Date.FormatStyle.TimeStyle
  @State private var visNote = false
  
    var body: some View {
      Text("\(måling.tid.formatted(date: .abbreviated, time: dateFormatStyle)):")
      Spacer()
      Text("\(måling.værdi.formatted(.number)) \(måleenhed)")
      
      if måling.note.trimmingCharacters(in: .whitespaces).count > 0 {
        Button("*") {
          visNote = true
        }
        .sheet(isPresented: $visNote) {
          Text(måling.note)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
        .foregroundColor(.black)
        //                  .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
      } else {
        Text("      ")
      }
    }
}

struct MålingView_Previews: PreviewProvider {
    static var previews: some View {
      MålingView(måling: Binding<Måling>.constant(
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!, værdi: 42.3512345678, note: "")),
                 måleenhed: "mmol",
                 dateFormatStyle: Date.FormatStyle.TimeStyle.omitted)
    }
}
