//
//  MålingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 24/08/2023.
//

import SwiftUI

struct MålingView: View {
  @Bindable var måling: Måling
  var måleenhed: String
  var formatStyle: Date.FormatStyle
  
  @State private var visNote = false
  
  var body: some View {
    HStack {
      Text("\(formatStyle.format(måling.tid)):")
        .frame(width: 160.0, height: nil, alignment: .leading)
      Text("\(måling.værdi.formatted(.number)) \(måleenhed)")
        .frame(width: 150, height: 20, alignment: .trailing)
        .fontWeight(.bold)
      if måling.note.trimmingCharacters(in: .whitespaces).count > 0 {
        Button("*") {
          visNote = true
        }
        .sheet(isPresented: $visNote) {
          Text(måling.note)
            .presentationDragIndicator(.visible)
            .presentationDetents([.fraction(0.25),.fraction(0.50),.fraction(0.75),.fraction(1)])
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
          Spacer()
        }
        .foregroundColor(.blue)
        .buttonBorderShape(.roundedRectangle)
      } else {
        Text(" ")
          .frame(width: 20, height: nil, alignment: .trailing)
      }
      Spacer()
    }
  }
}

func findDatoFormat(inkluderTid: Bool) -> Date.FormatStyle {
  return inkluderTid
  ? Date.FormatStyle()
    .locale(Locale(identifier: "da_DK"))
    .year(.padded(4))
    .month(.twoDigits)
    .day(.twoDigits)
    .hour(.twoDigits(amPM: .omitted))
    .minute(.twoDigits)
  : Date.FormatStyle()
    .locale(Locale(identifier: "da_DK"))
    .year(.padded(4))
    .month(.twoDigits)
    .day(.twoDigits)
}

