//
//  MaalingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 24/08/2023.
//

import SwiftUI

struct MaalingView: View {
  @Bindable var tendens: Tendens
  @Bindable var maaling: Maaling
  var maaleenhed: String
  var formatStyle: Date.FormatStyle
  
  @State private var visNote = false
  
  var body: some View {
    HStack {
      Text("\(formatStyle.format(maaling.tid)):")
        .frame(width: 160.0, height: nil, alignment: .leading)
      Text("\(maaling.vaerdi.formatted(.number)) \(maaleenhed)")
        .frame(width: 120, height: 20, alignment: .trailing)
        .fontWeight(.bold)
      if maaling.note.trimmingCharacters(in: .whitespaces).count > 0 {
        Text(Image(systemName: "note.text"))
//        Button("*") {
//          visNote = true
//        }
//        .sheet(isPresented: $visNote) {
//          Text(maaling.note)
//            .presentationDragIndicator(.visible)
//            .presentationDetents([.fraction(0.25),.fraction(0.50),.fraction(0.75),.fraction(1)])
//            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
//          Spacer()
//        }
//        .presentationDragIndicator(.visible)
//        .presentationDetents([.fraction(0.25),.fraction(0.50),.fraction(0.75),.fraction(1)])
//        .foregroundColor(.primary)
//        .buttonBorderShape(.roundedRectangle)
      } else {
        Text(" ")
          .frame(width: 20, height: nil, alignment: .trailing)
      }
      Spacer()
    }
    .foregroundColor(Color(rgb: 0x0f3433))
    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
      Button(role: .destructive) {
        sletMaalinger(tendens, maaling)
      } label: {
        Label("Slet", systemImage: "trash")
      }
      NavigationLink(
        destination:
          RedigerMaalingView(tendens: tendens, item: maaling, nyMaaling: false),
        label: 
          { Label("Rediger", systemImage: "pencil") })
    }
  }
}

func sletMaalinger(_ tendens: Tendens, _ maalingSlet: Maaling) {
  for ix in 0...tendens.maalinger.count-1 {
    if tendens.maalinger[ix].id == maalingSlet.id {
      tendens.maalinger.remove(at: ix)
      break
    }
  }
}

#Preview {
  Group {
    let tendens = Tendens(
      1,
      "Grøn cirkel",
      "kg",
      true,
      [Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22, hour: 13, minute: 20, second: 15))!,   vaerdi: 83, note: ""),
       Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24, hour: 12, minute: 20, second: 15))!,   vaerdi: 77, note: ""),
       Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2, hour: 11, minute: 20, second: 15))!,   vaerdi: 73, note: "")])
    
    @State var maaling = Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24, hour: 12, minute: 20, second: 15))!,   vaerdi: 77, note: "Hansen")
    
    let dateformat = Date.FormatStyle()
      .locale(Locale(identifier: "da_DK"))
      .year(.padded(4))
      .month(.twoDigits)
      .day(.twoDigits)
//      .hour(.twoDigits(amPM: .omitted))
//      .minute(.twoDigits)
    MaalingView(tendens: tendens, maaling: maaling, maaleenhed: "Stk", formatStyle: dateformat)
  }
}
